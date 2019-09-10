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

#define SERIAL_BUFFER_SIZE    8
// queue depth is how many messages can be waiting for the main program at any given time.
#define QUEUE_DEPTH           3

#define TICKS_PER_METER       10185   // 1920 pulses per wheel revolution
                                      // 188.5mm/revolution with a 60mm wheel
                                      // 5.30 revolutions per meter





// PID control values
#define P_TERM                1 // 2     // 2 and 3 gets the velocity there in about 5 cycles
#define I_TERM                0     
#define D_TERM                1 // 3   



// Stuff relating to Morse code:
#define DOT_DELAY            30 // for morse code


char* letters[] = 
{
  ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", // A-I
  ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", // J-R
  "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.." // S-Z
};

char* numbers[] = 
{
  "-----", ".----", "..---", "...--", "....-", ".....",
  "-....", "--...", "---..", "----."
};





// for motor control
unsigned int interruptsLeft = 0; // Used for determining how far to drive
int desiredLeftVelocity = 0;
int desiredRightVelocity = 0;
bool inMotion = false;


// For keeping track of position
long leftEncoder;   // Actual position of the encoder
long rightEncoder; 
int  leftEncoderVelocity; // This is reset every interrupt and is used for PID calculations
int  rightEncoderVelocity;


// Used by the serial routines for commuincating with the main processor
long lastLeftEncoder; // since it was last checked via serial command  TODO:  Change interrupt to use a local version
long lastRightEncoder;

byte statusByte;  // for sending status messages

bool thereIsAnUserMessage;
byte userMessageSize;
byte currentUserMessageCharacter;
byte ignore;



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

  statusByte = 1;


  // Set up the encoder interrupts
  // By default the external interrupts have higher priority than timer interrupts.  That is what I want.
  attachInterrupt(digitalPinToInterrupt(LEFT_ENCODER_A), leftEncoderInterrupt, CHANGE);
  attachInterrupt(digitalPinToInterrupt(RIGHT_ENCODER_A), rightEncoderInterrupt, CHANGE);

  // Set up the PID interrupt
  leftEncoder = 0;
  rightEncoder = 0;
  lastLeftEncoder = 0; 
  lastRightEncoder = 0;
  
  // The timer1 interrupt code was taken from http://www.8bit-era.cz/arduino-timer-interrupts-calculator.html
  // I'm not sure if it is necessary to do this because the Arduino is already using an interrupt at 1000Hz for millis()
  
  // TIMER 0 for interrupt frequency 1000 Hz:
  cli(); // stop interrupts
  TCCR0A = 0; // set entire TCCR0A register to 0
  TCCR0B = 0; // same for TCCR0B
  TCNT0  = 0; // initialize counter value to 0
  // set compare match register for 1000 Hz increments
  OCR0A = 249; // = 16000000 / (64 * 1000) - 1 (must be <256)
  // turn on CTC mode
  TCCR0B |= (1 << WGM01);
  // Set CS02, CS01 and CS00 bits for 64 prescaler
  TCCR0B |= (0 << CS02) | (1 << CS01) | (1 << CS00);
  // enable timer compare interrupt
  TIMSK0 |= (1 << OCIE0A);
  sei(); // allow interrupts
        
} // end of setup()







void loop()
{  
//  Serial.print("Left: ");
//  Serial.println(leftEncoder);
//  Serial.print("Right: ");
//  Serial.println(rightEncoder);
//  Serial.println(" ");

  // I want to drive 5000 ticks at a velocity of 30 ticks per interrupt
  // 5000/30 = 166.666


//  // Control the left motor using the right motor using the interrupt routine.
//  // Note that the interrupt routine needs to have the call to driveRightMotor commented out.
//  desiredLeftVelocity = constrain(rightEncoder, -150,150);
//  interruptsLeft = 1;
//  inMotion = true;

//  // Control the right motor using the left motor using the interrupt routine.
//  // Note that the interrupt routine needs to have the call to driveLeftMotor commented out.
//  desiredRightVelocity = constrain(leftEncoder, -150,150);
//  interruptsLeft = 1;
//  inMotion = true;


  

  desiredLeftVelocity = 40;
  desiredRightVelocity = 30;
  int desiredTicks = 5000;
  interruptsLeft = desiredTicks/desiredLeftVelocity;
  inMotion = true;

  Serial.println("PART A");
  while(inMotion == true)
    {
      //Serial.println("A"); // Works
      //ignore++; // doesn't work
      digitalWrite(LED,HIGH); // Works
    }

  digitalWrite(LED,LOW);
  beep(100,1600);
  delay(300);



  
  desiredLeftVelocity = -20;
  desiredRightVelocity = -10;
  interruptsLeft = desiredTicks/abs(desiredLeftVelocity);

  inMotion = true;

  Serial.println("PART B");
  while(inMotion == true)
    { // This While loop needs something in it in order for it to kick out of the loop!
      //Serial.println("B");
      digitalWrite(LED,HIGH); // TODO:  Find some other instruction that doesn't get optimized away by the compiler
    }

  digitalWrite(LED,LOW);
  beep(100,1200);




// Control using analogWrite rather than the interrrupt routine.
//  // Proportionally control the left motor using the right motor
//  driveLeftMotor(true,constrain(rightEncoder, 0, 255));
//  Serial.println(rightEncoder);

//  // Proportionally control the right motor using the left motor
//  driveRightMotor(true,constrain(leftEncoder, 0, 255));
//  Serial.println(leftEncoder);

}








void beep(unsigned int duration, int frequency)
{ // beeps for duration milliseconds at the desired frequency

  // Calculate the delay needed for the desired frequency
  int delayInMicroseconds = 1000000 / frequency;

  unsigned long numberOfCycles = duration; // I'm breaking this up to avoid math issues that give incorrect results
  numberOfCycles *= 1000;
  numberOfCycles /= delayInMicroseconds;

  bool pinState = 0;
  
  for(int I = 0; I < numberOfCycles; I++)
  {
    if(pinState)
      digitalWrite(BEEPER, LOW);
    else
      digitalWrite(BEEPER,HIGH);
    pinState = !pinState;

    delayMicroseconds(delayInMicroseconds);
  }

  // Set the BEEPER pin LOW to conserve power
  digitalWrite(BEEPER, LOW);
}



void sendMorseString(char* theString)
{ // Sends letters, numbers and spaces only.  Punctuation or other characters will be ignored.
  // This is used at startup only.  During normal operation, characters are sent one at a time between successive loop()'s.
  char ch;
  int I = 0;
  while (theString[I] != NULL)
  {
    ch = theString[I];
    I++;

    if (ch >= 'a' && ch <= 'z')
    {
      sendMorseCharacter(letters[ch - 'a']);
    }

    else if (ch >= 'A' && ch <= 'Z')
    {
      sendMorseCharacter(letters[ch - 'A']);
    }

    else if (ch >= '0' && ch <= '9')
    {
      sendMorseCharacter(numbers[ch - '0']);
    }

    else if (ch == ' ') // SPACE
    {
      int temp = DOT_DELAY;
      temp *= 6; // Was 4
      delay(temp);
    }
  }
}

void sendMorseCharacter(char* sequence)
{
  int I = 0;
  while (sequence[I] != NULL)
  {
    outputDotOrDash(sequence[I]);
    I++;
  }
  int temp = DOT_DELAY;
  temp *= 6;
  delay(temp); // space between characters
}



void outputDotOrDash(char dotOrDash)
{
  int dashDelay = DOT_DELAY;
  dashDelay *= 3;
  
  if (dotOrDash == '.')
    beep(DOT_DELAY, 2000);
  else // must be a -  
    beep(dashDelay, 2000);
  delay(dashDelay); //  space between beeps
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


void driveLeftMotor(bool forward, int speed)
{// Drives the left motor in the direction specified relative to the robot
// // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 35.
// // They stop moving at a value of about 32.
//
  
  
  // adjust the speed and then limit to 255
  if(speed != 0) // Allow it to truly stop
    speed += 35;
    
  if(speed > 255)
    speed = 255;
  
  if(forward)
  {
    digitalWrite(LEFT_MOTOR_DIRECTION,LOW);
    analogWrite(LEFT_MOTOR_PWM,speed);
  }
  else
  {
    digitalWrite(LEFT_MOTOR_DIRECTION,HIGH);
    analogWrite(LEFT_MOTOR_PWM,255-speed);
  }
}




void driveRightMotor(bool forward, int speed)
{// Drives the right motor in the direction specified relative to the robot
// // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 35.
// // They stop moving at a value of about 32.
//
  // adjust the speed and then limit to 255
  if(speed != 0) // Allow it to truly stop
    speed += 35;
  if(speed > 255)
    speed = 255;
    
  if(forward)
  {
    digitalWrite(RIGHT_MOTOR_DIRECTION,HIGH);
    analogWrite(RIGHT_MOTOR_PWM,255-speed);
  }
  else
  {
    digitalWrite(RIGHT_MOTOR_DIRECTION,LOW);
    analogWrite(RIGHT_MOTOR_PWM,speed);
  }
}




void leftEncoderInterrupt()
{ /*  This interrupt happens when the A input of the left encoder changes. 
      I'm not sure how to look at the assembly code generated by an Arduino sketch so I'm basing my timing information 
      on information from http://www.gammon.com.au/interrupts
      It is saying that using attachInterrupt() It takes 5.125 uS to just jump into and out of an interrupt.  That gives an interrupt
      rate of 195,121 interrupts per second if nothing is done. Divide that by two encoders and I get 97560 interrupts per second per encoder.
      Given that my encoders are 16 pulses per revolution and the gearbox is 120:1 I should have 1920 pulses per wheel revolution.  The motor has a 
      no-load RPM of 160 at 6V.  This works out to 2.667 revolutions per second.  This gives a maximum pulse rate of 5120 pulses per second.  This is 
      well within the maximum so I won't bother to optimize to make this routine faster.
  */  
  bool A = digitalRead(LEFT_ENCODER_A);
  bool B = digitalRead(LEFT_ENCODER_B);

  if(A)
  {
    if(B)
    {
      leftEncoder++;
      leftEncoderVelocity++;
    }
    else
    {
      leftEncoder--;
      leftEncoderVelocity--;   
    }
  }
  else
  {
    if(B)
    {
      leftEncoder--;
      leftEncoderVelocity--;
    }
    else
    { 
      leftEncoder++;
      leftEncoderVelocity++;
    }
  }
}



void rightEncoderInterrupt()
{ /*  This interrupt happens when the A input of the left encoder changes. 
  */  
  bool A = digitalRead(RIGHT_ENCODER_A);
  bool B = digitalRead(RIGHT_ENCODER_B);

  if(A)
  {
    if(B)
    {
      rightEncoder++;
      rightEncoderVelocity++;
    }
    else
    {
      rightEncoder--;   
      rightEncoderVelocity--;
    }
  }
  else
  {
    if(B)
    {
      rightEncoder--;
      rightEncoderVelocity--;
    }
    else
    {
      rightEncoder++;
      rightEncoderVelocity++;
    }
  }
}













ISR(TIMER0_COMPA_vect)
{
  static byte interruptCount = 0;
  
  static int leftThrottle = 0;
  static int rightThrottle = 0;
  
  static int lastLeftPterm = 0;
  static int lastRightPterm = 0;
  
  
  

  // This interrupt is happening at approximately 1000 Hz. That is too fast for my needs.  
  // I made it this way so that millis will still work and also because using timer 1 to get my actual
  // desired interrupt rate caused problems with PWM.  Both PWM pins use timer1 as their PWM clock source.
  
  if(inMotion == false)
  {
    driveLeftMotor(true,0);
    driveRightMotor(true,0);
  }
  
  
  if(++interruptCount == 50)
    {
      //digitalWrite(LED,HIGH);
      if(inMotion)
      {
        
        interruptCount = 0; 
  
        // This portion of the code runs at about 20Hz
        // At 30 Hz, I can get encoder differences of up to about +-170 at 6V
        int actualLeftVelocity = leftEncoderVelocity;
        int actualRightVelocity = rightEncoderVelocity;
        
        leftEncoderVelocity = 0;
        rightEncoderVelocity = 0;
  
  
        Serial.print(actualRightVelocity);
        Serial.print(" ");
        Serial.println(actualLeftVelocity);
  
        
        // #################
        // Proportional term
        // #################
        int Pl = actualLeftVelocity - desiredLeftVelocity;
        int Pr = actualRightVelocity - desiredRightVelocity;
        
  
        // #################
        // Differential term
        // #################
        int Dl = Pl - lastLeftPterm;
        lastLeftPterm = Pl;
   
        int Dr = Pr - lastRightPterm;
        lastRightPterm = Pr;
  
  
        // Adjust things by their scale factors
        Pl *= P_TERM;
        Pr *= P_TERM;
        
        Dl *= D_TERM;
        Dr *= D_TERM;
  
        // Adjust the throttle
        leftThrottle += Pl;
        leftThrottle += Dl;

        rightThrottle -= Pr; // This is different from the left motor.  I may have the wires to the 
        rightThrottle -= Dr; // motor backwards or something... 

        leftThrottle = constrain(leftThrottle,-255,255);
        rightThrottle = constrain(rightThrottle,-255, 255);

        
        if(leftThrottle > 0)
          driveLeftMotor(true,min(leftThrottle,255));
        else
          driveLeftMotor(false,min(abs(leftThrottle),255));

        if(rightThrottle > 0)
          driveRightMotor(true,min(rightThrottle,255));
        else
          driveRightMotor(false,min(abs(rightThrottle),255));

        
          

        // Determine if it should keep going  
        interruptsLeft--;
        if(interruptsLeft == 0)
          {
          inMotion = false;
          }
      } // end of if inMotion
    }

  //digitalWrite(LED,LOW);
}
