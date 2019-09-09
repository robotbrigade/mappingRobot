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


#define LEFT_MOTOR_PWM        10    // Pins 6 and 9 are capable of analog write.  The control scheme will need to take into account
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

#define TICKS_PER_METER       10000   // TODO:   Figure out the correct value for this (1920 pulses per wheel revolution)


//                                     // 100Hz rate
//#define P_TERM                4   // 4                
//#define I_TERM                3    // 3 
//#define D_TERM                35   // 35



//                                   // 30Hz rate 
//#define P_TERM                20    // 4
//#define I_TERM                0    // 3 
//#define D_TERM                85   // 35

      
                                   
//// 50Hz rate no shifting after the multiplication -  These ones are pretty good
//#define P_TERM                4    
//#define I_TERM                3    
//#define D_TERM                35   

//// 50Hz rate with shifting after multiplication
//#define P_TERM                90     //  90 // These values allow about 16 ticks in error
//#define I_TERM                45     //  45
//#define D_TERM                450    // 450

//// 50Hz rate with shifting after multiplication
//#define P_TERM                110     //  90 // These values allow about 16 ticks in error
//#define I_TERM                60     //  45
//#define D_TERM                900    // 450

//// 50Hz rate with shifting after multiplication
//#define P_TERM                80    //  90 // These values allow about 16 ticks in error
//#define I_TERM                0      //  45
//#define D_TERM                800    // 450

// 50Hz rate with shifting after multiplication
#define P_TERM                0    //  90 // These values allow about 16 ticks in error
#define I_TERM                50      //  45
#define D_TERM                800    // 450


#define PID_HISTORY_DEPTH     3



#define PID_SHIFT_POSITIONS   4     // effectively divide the PID terms by 16


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
int leftMotorTicksPerInterrupt = 0;
int rightMotorTicksPerInterrupt = 0;
unsigned int remainingInterruptsToDriveMotors = 0;

// For keeping track of position
long leftEncoder; 
long rightEncoder;
long lastLeftEncoder; // since it was last checked via serial command
long lastRightEncoder;

byte statusByte;  // for sending status messages

bool thereIsAnUserMessage;
byte userMessageSize;
byte currentUserMessageCharacter;



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

//    //delay(300);
//    sendMorseString("A");
//    digitalWrite(PROCESSOR_ENABLE, HIGH);
//    //delay(200);
//    sendMorseString("B");
//    digitalWrite(MOTORS_ENABLE,HIGH); // Powers up the H-bridge

    
    statusByte = 1;

//    // Test the H-bridge
//    delay(200);  // Give the power supply time to stabilize 
////
//    Serial.println("Ramping left motor up forward");
//    for(int I = 0; I < 256; I++)
//    {
//      delay(10);
//      driveLeftMotor(true,I);
//    }
//
//    Serial.print("Ramping left motor down forward");
//    for(int I = 255; I > -1; I--)
//    {
//      delay(10);
//      driveLeftMotor(true,I);
//    }
//
//
//    // Now do it the other direction:
//    
//    Serial.print("Ramping left motor up backward");
//    for(int I = 0; I < 256; I++)
//    {
//      delay(10);
//      driveLeftMotor(false,I);
//    }
//
//    
//    Serial.print("Ramping left motor down backward");
//    for(int I = 255; I > -1; I--)
//    {
//      delay(10);
//      driveLeftMotor(false,I);
//    }
//
//
//
//
//    // Now do the same for the right motor
//    
//    Serial.print("Ramping right motor up forward");
//    for(int I = 0; I < 256; I++)
//    {
//      delay(10);
//      driveRightMotor(true,I);
//    }
//    
//    Serial.print("Ramping right motor down forward");
//    for(int I = 255; I > -1; I--)
//    {
//      delay(10);
//      driveRightMotor(true,I);
//    }
//    
//    Serial.print("Ramping right motor up backward");
//    for(int I = 0; I < 256; I++)
//    {
//      delay(10);
//      driveRightMotor(false,I);
//    }
//    
//    Serial.print("Ramping right motor down backward");
//    for(int I = 255; I > -1; I--)
//    {
//      delay(10);
//      driveRightMotor(false,I);
//    }

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

//    // TIMER 1 for interrupt frequency 30.00120004800192 Hz:
//    cli(); // stop interrupts
//    TCCR1A = 0; // set entire TCCR1A register to 0
//    TCCR1B = 0; // same for TCCR1B
//    TCNT1  = 0; // initialize counter value to 0
//    // set compare match register for 30.00120004800192 Hz increments
//    OCR1A = 8332; // = 16000000 / (64 * 30.00120004800192) - 1 (must be <65536)
//    // turn on CTC mode
//    TCCR1B |= (1 << WGM12);
//    // Set CS12, CS11 and CS10 bits for 64 prescaler
//    TCCR1B |= (0 << CS12) | (1 << CS11) | (1 << CS10);
//    // enable timer compare interrupt
//    TIMSK1 |= (1 << OCIE1A);
//    sei(); // allow interrupts


    // TIMER 1 for interrupt frequency 50 Hz:
    cli(); // stop interrupts
    TCCR1A = 0; // set entire TCCR1A register to 0
    TCCR1B = 0; // same for TCCR1B
    TCNT1  = 0; // initialize counter value to 0
    // set compare match register for 50 Hz increments
    OCR1A = 39999; // = 16000000 / (8 * 50) - 1 (must be <65536)
    // turn on CTC mode
    TCCR1B |= (1 << WGM12);
    // Set CS12, CS11 and CS10 bits for 8 prescaler
    TCCR1B |= (0 << CS12) | (1 << CS11) | (0 << CS10);
    // enable timer compare interrupt
    TIMSK1 |= (1 << OCIE1A);
    sei(); // allow interrupts
//    
//    // TIMER 1 for interrupt frequency 100 Hz:
//    cli(); // stop interrupts
//    TCCR1A = 0; // set entire TCCR1A register to 0
//    TCCR1B = 0; // same for TCCR1B
//    TCNT1  = 0; // initialize counter value to 0
//    // set compare match register for 100 Hz increments
//    OCR1A = 19999; // = 16000000 / (8 * 100) - 1 (must be <65536)
//    // turn on CTC mode
//    TCCR1B |= (1 << WGM12);
//    // Set CS12, CS11 and CS10 bits for 8 prescaler
//    TCCR1B |= (0 << CS12) | (1 << CS11) | (0 << CS10);
//    // enable timer compare interrupt
//    TIMSK1 |= (1 << OCIE1A);
//    sei(); // allow interrupts

//    // TIMER 1 for interrupt frequency 150.00375009375233 Hz:
//    cli(); // stop interrupts
//    TCCR1A = 0; // set entire TCCR1A register to 0
//    TCCR1B = 0; // same for TCCR1B
//    TCNT1  = 0; // initialize counter value to 0
//    // set compare match register for 150.00375009375233 Hz increments
//    OCR1A = 13332; // = 16000000 / (8 * 150.00375009375233) - 1 (must be <65536)
//    // turn on CTC mode
//    TCCR1B |= (1 << WGM12);
//    // Set CS12, CS11 and CS10 bits for 8 prescaler
//    TCCR1B |= (0 << CS12) | (1 << CS11) | (0 << CS10);
//    // enable timer compare interrupt
//    TIMSK1 |= (1 << OCIE1A);
//    sei(); // allow interrupts


//  leftMotorTicksPerInterrupt = 1;
//  rightMotorTicksPerInterrupt = 5;
        
} // end of setup()




void loop()
{

//  digitalWrite(LED, HIGH); // blink forever
//  delay(500);
//  digitalWrite(LED, LOW);
//  delay(500); 

//  // turn on the LED if the button is pushed, also test the hardware serial port
//  if(digitalRead(BUTTON))  
//  {
//    digitalWrite(LED, HIGH);
//    Serial.println("High");
//  }
//  else
//  {
//    digitalWrite(LED,LOW);
//    Serial.println("Low");
//  }

  
//   if(digitalRead(BUTTON))  //  Turn off the power if the button is pushed
//    digitalWrite(MAIN_POWER_ENABLE, LOW);


//// Verify that the battery reading rotine works properly
//  byte batteryVoltage = readBattery();
//  delay(100);



//  Check to see if the encoders are working
//  Uncomment only one of these at a time and rotate the appropriate motor.  If the LED blinks, it is working.
//    digitalWrite(LED,digitalRead(LEFT_ENCODER_A)); // yes
//    digitalWrite(LED,digitalRead(LEFT_ENCODER_B)); // no
//    digitalWrite(LED,digitalRead(RIGHT_ENCODER_A)); //yes
//    digitalWrite(LED,digitalRead(RIGHT_ENCODER_B)); // yes
    
  Serial.print("Left: ");
  Serial.println(leftEncoder);
  Serial.print("Right: ");
  Serial.println(rightEncoder);
  Serial.println(" ");
  delay(100);

  // Proportionally control the left motor using the right motor
//  if(rightEncoder > 0)
//  {
//    driveLeftMotor(true,rightEncoder);
//  }
//  else
//  {
//    driveLeftMotor(false,abs(rightEncoder));
//  }



//  long startTime = millis();
//  long endTime = startTime + 1000;
//  Serial.print("Start: ");
//  Serial.println(startTime);
//  Serial.print("End: ");
//  Serial.println(endTime);
//
//    
//  while(millis() < endTime)
//    {
//      Serial.println(millis());
//    }
//  // Now disable interrupts
//  cli(); // stop interrupts
//  while(1)
//  {
//    
//  }
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
// // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 45.
// // They stop moving at a value of about 32.
//
//  // adjust the speed and then limit to 255
//  speed += 40;
//  if(speed > 255)
//    speed = 255;
    
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
// // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 45.
// // They stop moving at a value of about 32.
//
//  // adjust the speed and then limit to 255
//  speed += 40;
//  if(speed > 255)
//    speed = 255;
    
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
      leftEncoder++;
    else
      leftEncoder--;   
  }
  else
  {
    if(B)
      leftEncoder--;
    else
      leftEncoder++;
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
      rightEncoder++;
    else
      rightEncoder--;   
  }
  else
  {
    if(B)
      rightEncoder--;
    else
      rightEncoder++;
  }
}











ISR(TIMER1_COMPA_vect)
{
  // This ISR does the PID control of the motors.  

  
// This (commented out) chunk of code is to verify that the interrupt is happening at the rate that you expect.  
// It should blink the LED at 1/2 of the interrupt rate (one interrupt turns it on and the next turns it off)
/*
  static bool lastState = false;
  if(lastState)
  {
    lastState = false;
    digitalWrite(LED,HIGH);
  }
  else
  {
    lastState = true;
    digitalWrite(LED,LOW);
  }
*/

/* There is a line of thinking that interrupt should be as short as possible and only set flags for the main program to address.
    I'm not going to do that in this case because I worry about there being too much jitter in the timing of the PID loop, which 
    could lead to instability in the motors' speeds. That worry may be unfounded though.  If this code is still here when you read
    this then everything has worked out. It looks like the motor encoder interrupts happen rarely enough that the relative length of 
    this routine won't cause it to miss any encoder ticks.

    This function implements velocity PID as really just positional PID where the desired position is just incremented at each PID
    loop.  For now, the velocity is fixed throughout the move.  I may change this to ramp up and down the velocity if I find that 
    there is excessive wheel slip at the starts and stops.  

    NOTE:  I used to work with the PIC processor, which doesn't have a multiply instruction so I was prepared to write a specialized 
    multiply function to multiply a long and something shorter together but after looking around, apparently it only takes 12 cycles
    to multiply two longs together on an AVR so there is no need to optimize.  This will be plenty fast as long as I am doing division 
    using bit shifts.
  
  */

  digitalWrite(LED,HIGH); // This is here so that I can use my logic analyzer or oscilliscope to see how long this takes to run 
                                 // and what the actual interrupt rate is.  

  static long desiredLeftEncoder = 0;
  static long desiredRightEncoder = 0;
  static int leftDifHistory[PID_HISTORY_DEPTH]= {0};
  static int rightDifHistory[PID_HISTORY_DEPTH] = {0};

  // FOR TESTING ONLY!
  int leftDif = rightEncoder - leftEncoder; // This enables the left motor to mimic what the right motor is doing
  
  //int leftDif = desiredLeftEncoder - leftEncoder;       // diference between desired and actual position

  
  int rightDif = desiredRightEncoder - rightEncoder;    //  This could be up to about 512 counts on first interrupt after starting and 
                                                        //  would probably go higher for a bit.  Let's say 1500 max.
  
  desiredRightEncoder += rightMotorTicksPerInterrupt;   // Increment the desired position
  desiredLeftEncoder += leftMotorTicksPerInterrupt;
//
//  Serial.print(desiredLeftEncoder);
//  Serial.print(" ");
//  Serial.println(desiredRightEncoder);
  

  

  // #####################
  // P-term (Proportional)
  // #####################
  
  long leftP = leftDif;
  leftP *= P_TERM;  
  leftP >>= PID_SHIFT_POSITIONS; 
  
  long rightP = rightDif;
  rightP *= P_TERM;  
  rightP >>= PID_SHIFT_POSITIONS;


  // Shuffle the new differences into the history 
  for(int I = 0; I < PID_HISTORY_DEPTH - 1; I++)
  {
    leftDifHistory[I] = leftDifHistory[I+1];
  }
  leftDifHistory[PID_HISTORY_DEPTH - 1] = leftDif;


  for(int I = 0; I < PID_HISTORY_DEPTH - 1; I++)
  {
    rightDifHistory[I] = rightDifHistory[I+1];
  }
  rightDifHistory[PID_HISTORY_DEPTH - 1] = rightDif;

  
  // #################
  // I-term (Integral)
  // #################
  
  // Sum up this and previous differences
  long leftI = 0;
  for(int I = 0; I < PID_HISTORY_DEPTH; I++)
  {
    leftI += leftDifHistory[I];  
  }
  
  leftI *= I_TERM;
  leftI >>= PID_SHIFT_POSITIONS;


  long rightI = 0;
  for(int I = 0; I < PID_HISTORY_DEPTH; I++)
  {
    rightI += rightDifHistory[I];  
  }
  
  rightI *= I_TERM;
  rightI >>= PID_SHIFT_POSITIONS;


  //######################
  // D-term (Differential)
  //######################
  long leftD = leftDifHistory[PID_HISTORY_DEPTH-1] - leftDifHistory[PID_HISTORY_DEPTH-2];
  leftD *= D_TERM;
  leftD >>= PID_SHIFT_POSITIONS;

  long rightD = rightDifHistory[PID_HISTORY_DEPTH-1] - rightDifHistory[PID_HISTORY_DEPTH-2];
  rightD *= D_TERM;
  rightD >>= PID_SHIFT_POSITIONS;





  // Calculate the final PWM values and motor directions
  long temp = leftP + leftI + leftD;
  bool leftDir = temp < 0;
  byte leftPWM = min(255,abs(temp));

  
  temp = rightP + rightI + rightD;
  bool rightDir = temp < 0;
  byte rightPWM = min(255, abs(temp));

  // Set the PWM values and directions.

  driveLeftMotor(leftDir,leftPWM);
  //driveRightMotor(rightDir, rightPWM);   // This is commented out for testing only.  

    
  digitalWrite(LED,LOW); // so that I can see how long this interrupt took
}
