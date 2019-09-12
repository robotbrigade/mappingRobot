/*   Firmware for Arduino board V4

     Written by Jack Buffington 2019 with the exception of the Morse Code beep functions, which are lightly modified from
     what can be found on the Arduino website.

     This board controls the motors and power for the mapping robot.  It is tasked with the following:
 *   * Drive according to commands given by the main processor
 *   * Control the power to the main processor, motors, and itself.
 *   * Monitor the battery voltage
 *   * Track position via encoders
 *   * Output beep or tone codes via a speaker
 *   * Determines if a wheel is stuck
 *   * Monitors bump sensors

     Control of this board will be done via serial data <TODO:  Verify that this is true.  It could be through USB serial.>

     This program will address serial commands through the main loop and will do the real-time tasks such as PID and reading
     the encoders from within interrupts.

     This program maintains a status byte which can be sent to the host processor.  The status byte is as follows:
     
    Status byte: <76543210>
    bit 7: in motion
    bit 6: left wheel stuck
    bit 5: right wheel stuck
    bit 4: bump sensor pressed
    bit 3: extra 4 is high
    bit 2: extra 3 is high
    bit 1: extra 2 is high
    bit 0: last motion completed successfully


    To program my Arduino clone, I need to select the processor as ATMEGA328P (Old Bootloader) otherwise I get a bunch of this:
    
    avrdude: stk500_recv(): programmer is not responding
    avrdude: stk500_getsync() attempt 1 of 10: not in sync: resp=0x00
    avrdude: stk500_recv(): programmer is not responding
    avrdude: stk500_getsync() attempt 2 of 10: not in sync: resp=0x00

     
     

*/

#define VOLTAGE_DETECT        A0
#define SERVO_PWM             A2
#define PROCESSOR_ENABLE      A3
#define MOTORS_ENABLE         A4
#define BUTTON                A5

#define MAIN_POWER_ENABLE     5
#define BEEPER                4

#define RIGHT_ENCODER_A       3
#define RIGHT_ENCODER_B       6
#define LEFT_ENCODER_A        2
#define LEFT_ENCODER_B        11


#define LEFT_MOTOR_PWM        10    // Pins 9 and 10 are capable of analog write.  The control scheme will need to take into account
#define LEFT_MOTOR_DIRECTION  7   // the direction and sometimes invert the PWM to match the actual desired speed.  The two pins 
#define RIGHT_MOTOR_DIRECTION 8    // for each motor correspond to the two outputs for the motor or in other words, the L298 is actually
#define RIGHT_MOTOR_PWM       9    // A quad half bridge device with the enables done in pairs.  


#define EXTRA_IO_4            A7   // A7 is analog input only!
#define EXTRA_IO_3            A6   // A6 is analog input only!
#define EXTRA_IO_2            12
#define EXTRA_IO_1            A1
#define LED                   13

// 14.97V is where my drill considers the battery to be dead
// After sitting for a while, a freshly charged battery is at 20.2V
#define BATTERY_FULL          20200
#define BATTERY_DEAD          15000

//#define SERIAL_BUFFER_SIZE    8
//// queue depth is how many messages can be waiting for the main program at any given time.
//#define QUEUE_DEPTH           3




//
// PID control values (yes, I did play with the values but this ended up working good enough...)
// You may want to play with them more if you need to make more rapid starts and stops to avoid oscillation.  
#define P_TERM                1 // 2       
#define D_TERM                1 // 3   






// for motor control
//unsigned int interruptsLeft = 0; // Used for determining how far to drive
int desiredLeftVelocity = 0;   // Used by the PID interrupt routine.  Don't write to these directly.  Let setupMotion() write to them.
int desiredRightVelocity = 0;


// For communicating with the PID interrupt
int rampingUpTimeslotsGlobal;
int rampingDownTimeslotsGlobal;
int constantTimeslotsGlobal;
int leftMaxVelocityGlobal;
int rightMaxVelocityGlobal;
int leftAccelerationGlobal;
int rightAccelerationGlobal;
volatile bool inMotion = false; // Volatile so that the compiler doesn't optimize away loops waiting for it to change.
 

// For keeping track of position
long leftEncoder;   // Actual position of the encoder
long rightEncoder; 
int  leftEncoderVelocity; // This is reset every interrupt and is used for PID calculations
int  rightEncoderVelocity;


void setup()
{
  // Enable power to the whole board without requiring that the user hold the button.  
  digitalWrite(MAIN_POWER_ENABLE, HIGH);

  // Wait a moment for power to stabilize then check the main battery voltage
  delay(100);

  // Set the pins to be inputs or outputs
  pinMode(VOLTAGE_DETECT, INPUT);
  pinMode(SERVO_PWM, OUTPUT);
  pinMode(PROCESSOR_ENABLE, OUTPUT);
  pinMode(MOTORS_ENABLE, OUTPUT);
  pinMode(BUTTON, INPUT);
  pinMode(MAIN_POWER_ENABLE, OUTPUT);
  pinMode(BEEPER, OUTPUT);
  pinMode(RIGHT_ENCODER_A, INPUT);
  pinMode(RIGHT_ENCODER_B, INPUT);
  pinMode(LEFT_ENCODER_A, INPUT);
  pinMode(LEFT_ENCODER_B, INPUT);
  pinMode(LEFT_MOTOR_PWM, OUTPUT);
  pinMode(LEFT_MOTOR_DIRECTION, OUTPUT);
  pinMode(RIGHT_MOTOR_PWM, OUTPUT);
  pinMode(RIGHT_MOTOR_DIRECTION, OUTPUT);
  pinMode(EXTRA_IO_4, OUTPUT);
  pinMode(EXTRA_IO_3, OUTPUT);
  pinMode(EXTRA_IO_2, OUTPUT);
  pinMode(EXTRA_IO_1, OUTPUT);
  pinMode(LED, OUTPUT);

  // Set up the USB serial port
  Serial.begin(2000000);

  beep(50,16000);
  beep(50,8000);
  beep(50,4000);
  beep(50,2000);
  beep(50,1000);
  beep(50,500);
  beep(50,250);
  beep(50,125);
  beep(50,62);

  setupMotorStuff();
} // end of setup()







void loop()
{  

  // Control the motors with ramping
  setupMotion(100, 300, 80, 8000);
  while(inMotion == true)
    { // Just hang out while the movement happens
    }
  Serial.println("A");


  
  setupMotion(-20, -300, 500, 3000);
  while(inMotion == true)
    { // Just hang out while the movement happens
    }
  Serial.println("B");
}










byte readBattery()
{ // outputs a value in the range of 0 to 100 which represents the roughly remaining capacity of the battery in percentage.ch tex
  

  /*
   *  Due to the voltage divider that I am using:  200K and 47K, this multiplies the voltage by .1903
   *  With 1024 counts for 5V, to get the voltage read, I need to multiply the counts by 5 and divide by 1024.
   *  To get the actual voltage of the battery, I would want to multiply that by 1/.1903.  To get this voltage, 
   *  it is roughly equivalent to multiplying by (1681/65536).  Of course, since we are dealing with only whole 
   *  numbers, this doesn't leave much resolution so this program is working in voltage * 1000.  This makes the 
   *  calculation be <analog reading> * (1681702/65536).  An unsigned long can handle the values in the range 
   *   0-4,294,967,295.  1681702 * 1024 (the max reading) is 1,722,062,848.  This will fit within an unsigned long!
   */
  unsigned long batteryVoltage;
  batteryVoltage = analogRead(VOLTAGE_DETECT); // gives me a value in the range of 0 to 1024.
  Serial.print("ADC reading: ");
  Serial.println(batteryVoltage);

  
  batteryVoltage *= 1681702;
  batteryVoltage >>= 16; // Make sure that the calculation is fast rather than doing a real division.
  Serial.print("voltage: ");
  Serial.println(batteryVoltage);
  
  

  // Calculate the rough remaining battery capacity based on a linear relationship to the voltage
  batteryVoltage -= BATTERY_DEAD;

  word batteryRange = BATTERY_FULL - BATTERY_DEAD;
  // Since I am working in integer math, I can't just divide batteryVoltage by the battery range since I
  // would get zero every time so I'm going to multiply the battery voltage by 100 first to give me a result in the range of
  // 0 to ~100.
  batteryVoltage *= 100;

  batteryVoltage /= batteryRange;

  if (batteryVoltage > 100) // It could be higher because I set the full voltage a little lower than what it really
    batteryVoltage = 100;   // is when it is full.

  return batteryVoltage;
}
