import processing.serial.*;

// Global variables
int new_sX, old_sX;
int nX, nY;
Serial myPort;

// Setup the Processing Canvas
void setup(){
  size(600, 600 );
  fill(255);
 
  //Open the serial port for communication with the Arduino
  //Make sure the COM port is correct
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n'); 
  
}

// Draw the Window on the computer screen
void draw(){
  
  // Fill canvas grey
  background(#f2f2f2);
  
  
  fill(#84BF61);
  noStroke();
  rect(150, 0, 150, 600);
  fill(#FF4F44);
  noStroke();
  rect(300, 0, 150, 600);
  fill(#FFD502);
  noStroke();
  rect(450, 0, 150, 600);
  // Draw a circle at the mouse location
  stroke(255);
  fill(255);
  ellipse( nX, nY, 20, 20 );
  line(nX,0,nX,height); 


  
}


// Get the new mouse location and send it to the arduino
void mouseMoved(){
  nX = mouseX;
  nY = mouseY; 
  
  //map the mouse x coordinates to the LEDs on the Arduino.
  new_sX=(int)map(nX,0,600,3,7);

  if(new_sX==old_sX){
    //do nothing
  } else {
    //only send values to the Arduino when the new X coordinates are different.
    old_sX = new_sX;
    myPort.write(""+new_sX);
  }
}