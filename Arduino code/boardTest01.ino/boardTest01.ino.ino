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
#define FIVE_VOLT_ENABLE      A6
#define BEEPER                A7
#define RIGHT_ENCODER_A       2
#define RIGHT_ENCODER_B       4
#define LEFT_ENCODER_A        3
#define LEFT_ENCODER_B        5

#define MOTOR_CONTROLLER_6    6
#define MOTOR_CONTROLLER_5    7
#define MOTOR_CONTROLLER_4    8
#define MOTOR_CONTROLLER_3    9

#define LEFT_MOTOR_PWM        6   // TODO: THESE PINS ARE JUST A GUESS!  Figure out what they really are and fix this.
#define LEFT_MOTOR_DIRECTION  7
#define RIGHT_MOTOR_PWM       8
#define RIGHT_MOTOR_DIRECTION 9


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


#define DOT_DELAY            200 // for morse code

#define MAX_USER_MESSAGE_LENGTH   100



char* letters[] = {
  ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", // A-I
  ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", // J-R
  "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.." // S-Z
};

char* numbers[] = {
  "-----", ".----", "..---", "...--", "....-", ".....",
  "-....", "--...", "---..", "----."
};



byte serialBuffer[SERIAL_BUFFER_SIZE];
byte messageQueue[QUEUE_DEPTH][SERIAL_BUFFER_SIZE - 1];
byte messagesInQueue = 0;
byte userMessage[MAX_USER_MESSAGE_LENGTH];

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
  // Enable power to the Arduino
  digitalWrite(FIVE_VOLT_ENABLE, HIGH);

  // Wait a moment for power to stabilize then check the main battery voltage
  delay(100);

    // Set the pins to be inputs or outputs
    pinMode(VOLTAGE_DETECT, INPUT);
    pinMode(SERVO_PWM, OUTPUT);
    pinMode(PROCESSOR_ENABLE, OUTPUT);
    pinMode(MOTORS_ENABLE, OUTPUT);
    pinMode(BUTTON, INPUT);
    pinMode(FIVE_VOLT_ENABLE, OUTPUT);
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

}

void loop()
{
  digitalWrite(BEEPER, HIGH);
  delay(500);
  digitalWrite(BEEPER,LOW);
  delay(500); 

}
