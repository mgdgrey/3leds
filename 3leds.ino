void setup() {                
  // initialize the digital pins as an output.

  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
// Turn the Serial Protocol ON
  Serial.begin(9600);
}

void loop() {
  byte byteRead;

   /*  check if data has been sent from the computer: */
  if (Serial.available()) {
  
    /* read the most recent byte */
    byteRead = Serial.read();
    //You have to subtract '0' from the read Byte to convert from text to a number.
    byteRead=byteRead-'0';
    
    //Turn off all LEDS
    for(int i=5; i<8; i++){
      digitalWrite(i, LOW);
    }
    
    if(byteRead>0){
      //Turn on the relevant LEDs
      for(int i=1; i<(byteRead+1); i++){
        digitalWrite(i+1, HIGH);
      }
    }
  }
}

