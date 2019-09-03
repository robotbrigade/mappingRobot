/*   Firmware for Arduino board V3

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

#define MAIN_POWER_ENABLE      5
#define BEEPER                4

#define RIGHT_ENCODER_A       2
#define RIGHT_ENCODER_B       A6
#define LEFT_ENCODER_A        3
#define LEFT_ENCODER_B        A7

#define MOTOR_CONTROLLER_6    6
#define MOTOR_CONTROLLER_5    7
#define MOTOR_CONTROLLER_4    8
#define MOTOR_CONTROLLER_3    9

#define LEFT_MOTOR_PWM        6    // Pins 6 and 9 are capable of analog write.  The control scheme will need to take into account
#define LEFT_MOTOR_DIRECTION  7    // the direction and sometimes invert the PWM to match the actual desired speed.  The two pins 
#define RIGHT_MOTOR_DIRECTION 8    // for each motor correspond to the two outputs for the motor or in other words, the L298 is actually
#define RIGHT_MOTOR_PWM       9    // A quad half bridge device with the enables done in pairs.  


#define EXTRA_IO_4            10
#define EXTRA_IO_3            11
#define EXTRA_IO_2            12
#define EXTRA_IO_1            A1
#define LED                   13

// 14.97V is where my drill considers the battery to be dead
// It reads 23.85V when full.
#define BATTERY_FULL          23500
#define BATTERY_DEAD          15000

#define SERIAL_BUFFER_SIZE    8
// queue depth is how many messages can be waiting for the main program at any given time.
#define QUEUE_DEPTH           3

#define TICKS_PER_METER       10000   // TODO:   Figure out the correct value for this (1920 pulses per wheel revolution)

// How many times per second the PID interrupt happens per second.
#define PID_INTERRUPT_RATE    10
#define P_TERM                32   
#define I_TERM                0
#define D_TERM                0
#define PID_SHIFT_POSITIONS   6     // effectively divide the PID terms by 64


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



//byte serialBuffer[SERIAL_BUFFER_SIZE];
//byte messageQueue[QUEUE_DEPTH][SERIAL_BUFFER_SIZE - 1];
//byte messagesInQueue = 0;
//byte userMessage[MAX_USER_MESSAGE_LENGTH];

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
    pinMode(MOTOR_CONTROLLER_6, OUTPUT);
    pinMode(MOTOR_CONTROLLER_5, OUTPUT);
    pinMode(MOTOR_CONTROLLER_4, OUTPUT);
    pinMode(MOTOR_CONTROLLER_3, OUTPUT);
    pinMode(EXTRA_IO_4, OUTPUT);
    pinMode(EXTRA_IO_3, OUTPUT);
    pinMode(EXTRA_IO_2, OUTPUT);
    pinMode(EXTRA_IO_1, OUTPUT);
    pinMode(LED, OUTPUT);

    // Set up the USB serial port
    Serial.begin(9600);

    beep(100,16000);
    beep(100,8000);
    beep(100,4000);
    beep(100,2000);
    beep(100,1000);
    beep(100,500);
    beep(100,250);
    beep(100,125);
    beep(100,62);

    delay(300);
    sendMorseString("Robot ON");

}




void loop()
{
  digitalWrite(LED, HIGH);
  delay(500);
  digitalWrite(LED, LOW);
  delay(500); 

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
