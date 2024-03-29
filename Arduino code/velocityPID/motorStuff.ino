// Things in this file relate to driving the motors.  


void setupMotorStuff()
{
  // Set up the encoder interrupts
  // By default the external interrupts have higher priority than timer interrupts.  That is what I want.
  attachInterrupt(digitalPinToInterrupt(LEFT_ENCODER_A), leftEncoderInterrupt, CHANGE);
  attachInterrupt(digitalPinToInterrupt(RIGHT_ENCODER_A), rightEncoderInterrupt, CHANGE);

  // Set up the PID interrupt
  leftEncoder = 0;
  rightEncoder = 0;

  
  // A good reference for timer interrupt code is: http://www.8bit-era.cz/arduino-timer-interrupts-calculator.html
  // The Arduino codebase already has timer0 set up so that an interrupt (or something) happens every 1/1000th of 
  // a second so I'm just enabling my own interrupt here.  
  
  // enable timer compare interrupt
  TIMSK0 |= (1 << OCIE0A);
}



void driveLeftMotor(bool forward, int speed)
{// Drives the left motor in the direction specified relative to the robot
 // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 35.
 // They stop moving at a value of about 32.
 //  Don't use this function directly.  It is called by the timer0 ISR.
  
  
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

long readLeftEncoder()
{ // Use this function if you need to read from the encoder since it is multiple bytes and could be corrupted by an interrupt
  // happening during the read
  noInterrupts();
  long temp = leftEncoder;
  interrupts();
  return temp;
}

long readRightEncoder()
{ // Use this function if you need to read from the encoder since it is multiple bytes and could be corrupted by an interrupt
  // happening during the read
  noInterrupts();
  long temp = rightEncoder;
  interrupts();
  return temp;
}



void driveRightMotor(bool forward, int speed)
{// Drives the right motor in the direction specified relative to the robot
 // The speed is adjusted upward because the motors on this robot don't start moving until about a value of 35.
 // They stop moving at a value of about 32.
 //  Don't use this function directly.  It is called by the timer0 ISR.

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
  // This interrupt happens at 1000 Hz.  It controls the motors.  Updates to the motor velocities are made every 20th of a 
  // second by only performing velocity adjustments every 50th interrupt.  This interrupt was kept at 1000 Hz so that millis would still work.
  
  
  static byte interruptCount = 0;
  
  static int leftThrottle = 0;
  static int rightThrottle = 0;
  
  static int lastLeftPterm = 0;
  static int lastRightPterm = 0;
  static int multipliedLeftVelocity = 0;
  static int multipliedRightVelocity = 0;


  
  

  // This interrupt is happening at approximately 1000 Hz. That is too fast for my needs.  
  // I made it this way so that millis will still work and also because using timer 1 to get my actual
  // desired interrupt rate caused problems with PWM.  Both PWM pins use timer1 as their PWM clock source.
  
  if(inMotion == false)
  {
    driveLeftMotor(true,0);
    driveRightMotor(true,0);
  }

  interruptCount++;
  
  if(interruptCount == 25)
  { // Prepare for the next time that it drives the motors
    /*  
    rampingUpTimeslotsGlobal = rampingTimeslots;
    rampingDownTimeslotsGlobal = rampingTimeslots;
    constantTimeslotsGlobal = constantTimeslots;
    leftMaxVelocityGlobal = leftVelocity; // This is of either sign depending on direction
    rightMaxVelocityGlobal = rightVelocity;
    leftAccelerationGlobal = leftAcceleration; // This is of either sign depending on direction and is multiplied by 64.
    rightAccelerationGlobal = rightAcceleration;
    inMotion = true;
    */
    if(rampingUpTimeslotsGlobal)
    {
      rampingUpTimeslotsGlobal--;
      multipliedLeftVelocity += leftAccelerationGlobal;
      desiredLeftVelocity = multipliedLeftVelocity / 64; // Hopefully these divides don't take too long.  I may need to change to shifts and 
      multipliedRightVelocity += rightAccelerationGlobal; // assignment of sign if they do.  TODO:  See how long this takes using my oscilloscope
      desiredRightVelocity = multipliedRightVelocity / 64;
    }
    else if(constantTimeslotsGlobal)
    {
      constantTimeslotsGlobal--;
      multipliedLeftVelocity = leftMaxVelocityGlobal * 64;
      desiredLeftVelocity = leftMaxVelocityGlobal;
      multipliedRightVelocity = rightMaxVelocityGlobal * 64;
      desiredRightVelocity = rightMaxVelocityGlobal;
    }
    else if(rampingDownTimeslotsGlobal)
    {
      rampingDownTimeslotsGlobal--;
      multipliedLeftVelocity -= leftAccelerationGlobal;
      desiredLeftVelocity = multipliedLeftVelocity / 64; // Hopefully these divides don't take too long.  I may need to change to shifts and 
      multipliedRightVelocity -= rightAccelerationGlobal; // assignment of sign if they do.  TODO:  See how long this takes using my oscilloscope
      desiredRightVelocity = multipliedRightVelocity / 64; 
    }
    else
    {
      inMotion = false;
      driveLeftMotor(true,0);
      driveRightMotor(true,0);
    }
  }// end of if it should set up the velocity for next time



  
  if(interruptCount == 50)
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
  
  
//        Serial.print(actualRightVelocity);
//        Serial.print(" ");
//        Serial.println(actualLeftVelocity);
  
        
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

        
          

//        // Determine if it should keep going  
//        interruptsLeft--;
//        if(interruptsLeft == 0)
//          {
//          inMotion = false;
//          }
      } // end of if inMotion
    }

  //digitalWrite(LED,LOW);
}












void setupMotion(long leftVelocity, long rightVelocity, unsigned int acceleration, int duration)
{ // Calling this function to get the robot to make a move.  This function will calculate all of the information that the PID ISR needs to run.
  

  
  // Velocites are in mm/second.
  // duration is in milliseconds
  // acceleration is in mm/second^2

  // Acceptable velocities are up to about +-372 mm/sec
  // Acceptable accelerations are up to about 1500 mm/sec^2 but high ones will make for a jumpy transition
  // Ideally keep acceleration down below 500mm/sec
  // Acceleration is never negative.

  // TODO:  This could be made even better by specifying if it should ramp at the beginning and end separately so that movements could be chained together
  // Without it stopping between the moves.

  // Convert the values into ones that I can use directly


  // Actual travel time won't be exactly what the user requested due to acceleration and deceleration.  I am using the duration
  // and velocity to calculate distance, which is more important for the robot's needs.  

  // distance (ticks) = velocity * duration * 9.12/1000

  //                   (velocity) mm    (duration) ms      1s       9.12 ticks
  // distance(ticks) =           ---- *               * -------- * ------------
  //                               s                     1000ms         mm

  // 9.12/1000 doesn't work out nicely in integer division.  This works out to 2.33/256.  Using 2/256 (0.00781) is pretty far off from 0.00910 so I'm
  // going to use 37/4096 which is 0.00903.  This should still be faster than doing the divide.  
  
                         
   long leftDistanceInTicks = leftVelocity * duration * 37 ; // This is approximate but is going to be close enough for this application
   leftDistanceInTicks >>= 12;
   
   long rightDistanceInTicks = rightVelocity * duration * 37;
   rightDistanceInTicks >>= 12;
   


  

  // mm/sec to ticks/timeslot:

  // mm     0.05 seconds     9.12 ticks       ticks
  //---- * -------------- * ------------- = ----------
  // sec      timeslot           mm          timeslot

  // ticks per mm:
  // wheel is 67mm diameter.  This makes it 210.48mm circumference.  With 1920 ticks per revolution:  9.12 ticks per mm

  // I want this to be fast so 9.12 can be represented by 2335/256 and 0.05 is roughly 13/256.  Of course, to make it even 
  // faster, I can premultiply them to get 0.456 or 117/256 which works out to 0.457.

  // max speed is 3400 ticks per second, which translates into 1.77 rotations.  This is .372 meters per second or 372mm/second, 
  // which translates into 43524 when multiplied by 117.  This would overflow an int.  Need to use a long even though it is slower.  

  leftVelocity *= 117;
  leftVelocity >>= 8; // This is to ensure that the compiler divides by 256 using a shift.  

  rightVelocity *= 117;
  rightVelocity >>= 8;




  // mm/sec^2 to ticks/timeslot^2

  //     mm        9.12 ticks     0.05 sec     0.05 sec       ticks
  //----------- * ------------ * ---------- * ---------- = -------------
  // sec * sec         mm         timeslot     timeslot     timeslot ^2


  // Premultiplying the constants gives me 0.0228.  This is approximately 6/256, which is 0.0234.  
  acceleration *= 6;
  acceleration >>= 8;


  // Figure out which motor has more steps
  bool leftHasMoreSteps = abs(leftDistanceInTicks) > abs(rightDistanceInTicks);
  
  // Calculate ramping timeslots
  long totalTicks;
  int rampingTimeslots = 0;
  int rampingTicks = 0;
  long constantTicks;
  int constantTimeslots = 0;
  int maxVelocity;
  
  
  if(leftHasMoreSteps) // Then the left will ramp up to the full speed
  {
    totalTicks = abs(leftDistanceInTicks);
    maxVelocity = abs(leftVelocity);
  }
  else // The right has more (or equal) steps
  {
    totalTicks = abs(rightDistanceInTicks);
    maxVelocity = abs(rightVelocity);
  }


  // ################################
  // Calculate the ramping time slots
  // ################################
  
  // I'm taking a brute-force approach here because it simplifies the code and will only take slightly longer than 
  // the formulaic approach.
  int rampingVelocity = 0;;
  while(rampingTicks <= totalTicks && rampingVelocity < maxVelocity)
    {
      rampingVelocity += acceleration;
      rampingTicks += 2 * rampingVelocity; // *2 because it is accelerating and decelerating 
      rampingTimeslots++;
    }
  rampingTimeslots--; // This is here because the loop quits once the ramping ticks is greater than the total ticks
                      // or because it has surpassed the maximum velocity.  In either case, it shouldn't accelerate that much.


  // #################################
  // Calculate the constant time slots
  // #################################
  
  if(rampingTicks > totalTicks)
    constantTimeslots = 0;
  else
  {
    constantTicks = totalTicks - rampingTicks;
    constantTimeslots = constantTicks / maxVelocity; 
  }


  
  
  // Calculate the actual acceleration for each motor (*64)
  int leftAcceleration;
  int rightAcceleration;
  
  if(leftHasMoreSteps)
  {
    if(leftVelocity > 0)
      leftAcceleration = acceleration * 64;
    else
      leftAcceleration = -acceleration * 64;
    rightAcceleration = (rightVelocity * 64) / rampingTimeslots; // Costly division operation!!!
  }
  else
  {
    leftAcceleration = (leftVelocity * 64) / rampingTimeslots;  // Costly division operation!!!
    if(rightVelocity > 0)
      rightAcceleration = acceleration * 64;
    else
      rightAcceleration = -acceleration * 64;
  }


  // Everything is calculated now so store this information where the interrupt routine knows to find it. 
  rampingUpTimeslotsGlobal = rampingTimeslots;
  rampingDownTimeslotsGlobal = rampingTimeslots;
  constantTimeslotsGlobal = constantTimeslots;
  leftMaxVelocityGlobal = leftVelocity; // This is of either sign depending on direction
  rightMaxVelocityGlobal = rightVelocity;
  leftAccelerationGlobal = leftAcceleration; // This is of either sign depending on direction
  rightAccelerationGlobal = rightAcceleration;
  inMotion = true; 
}


void stopNow()
{ // Call this to immediately stop the robot.  
  inMotion = false;
  rampingUpTimeslotsGlobal = 0;
  rampingDownTimeslotsGlobal = 0;
  constantTimeslotsGlobal = 0;
}
