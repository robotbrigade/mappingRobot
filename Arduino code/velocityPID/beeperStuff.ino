// Things in this file relate to the beeper used on the robot board.  There is a beep routine that can beep for varying times at
// varying frequency and there is code to output Morse code messages.


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


// The Morse code code is lightly modified from what is on the Arduino website (I didn't feel like reinventing this particular wheel)
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
