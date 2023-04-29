// Music Visualizer v1.0
// Written by Debagnik Kar

// Variables 
float n; // Used to control the rotation of the circles
//float n3, n5, speed2; // Unused variables

// Importing libraries
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim; // Object for the Minim library
AudioPlayer mySong; // Object for the audio player

// Main setup
void setup() {
  fullScreen(P3D); // Full screen in 3D mode
  noCursor(); // Hides the mouse cursor
  smooth(); // Enables smooth rendering
  background(0); // Sets the background color to pitch black
  
  // Audio Player functions. To change song, just put another file named music.mp3
  minim = new Minim(this);
  mySong = minim.loadFile("music.mp3"); // Loads the audio file
  mySong.play(); // Starts playing the audio
}

// Main artwork
void draw() {
  // Sets the fill color of the background and draws a rectangle to cover the previous frame
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
  
  // Translates the origin to the center of the screen
  translate(width/2, height/2);
  
  // Loop through the audio buffer
  for (int i = 0; i < mySong.bufferSize(); i++) {
    // Calculates the angle for the current iteration
    float angle = sin(i + (n-2)) * 40;
    float x = sin(radians(i)) * (n/angle);
    
    // Calculates the amplitude of the sound in the left channel
    float leftLevel = mySong.left.level() * 20;
    
    // Generates random color values for the circle
    float R = 255;//random(0, 255);
    float G = 255;//random(0, 255);
    float B = 255;//random(0, 255);
    
    // Draws a circle at the current iteration's position
    ellipse(i, i, leftLevel, leftLevel);
    
    // Rotates the origin for the next iteration
    rotateZ(n * PI/3 * 0.08);
    
    // Sets the fill color of the circle
    fill(R, G, B);
    // Increments the "n" variable for the next iteration
    n = n + 0.008;
    
  }  // Unused increments for "n3" and "n5" variables
  //n3 = n3 + speed2;
  //n5 = n5 + speed2;
}
//Noice and finished
