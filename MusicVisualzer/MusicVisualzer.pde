// Music Visualizer v1.0
// Written by Debagnik Kar

//Variables 
float n;
float n3,n5,speed2;

//importing libraries

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer mySound;

//Main setup
void setup()
{
  fullScreen(P3D);
  noCursor();
  smooth();
  background(0); //pitch black background
  
  //Audio Player functions. to change song just put another file named music.mp3
  minim = new Minim(this);
    mySound = minim.loadFile("../music.mp3");
  mySound.play();
}

// Main artwork

void draw()
{
  
 fill(0,20);
 noStroke();
 rect(0, 0, width, height);
 translate(width/2, height/2);
 for(int i = 0; i < mySound.bufferSize(); i++)
 {
   float angle = sin(i + (n-2))*40;
   float x = sin(radians(i))*(n/angle);
   
   float leftLevel = mySound.left.level()*20; //calculating the amplitude of the sound in that moment form the left channel.
   float R = random(0,255);
   float G = random(0,255);
   float B = random(0,255);
   
   ellipse(i, i, leftLevel, leftLevel); //Defining circle.
   rotateZ(n*-PI/3*0.08); //rotation and speed
   
   fill(R, G, B);
 }
 n = n + 0.008;
 n3 = n3 + speed2;
 n5 = n5 + speed2;
}

//Noice and finished.
