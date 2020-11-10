//VARIABLES 
float n;
float n3;
float n5;
float speed2;
 
//MUSIC  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
 
 
//MAIN SETUP
void setup () {
  fullScreen(P3D);
  noCursor();
  smooth();
  background (0);
 
  minim = new Minim(this);
   mySound = minim.loadFile("music.wav");     
  mySound.play();
}
 
 
void draw () {
 
  fill(0, 20);  
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2); 
  
  int R = int(random(0,255));
  int G = int(random(0,255));
  int B = int(random(0,255));
  
  for (int i = 0; i < mySound.bufferSize() -1; i++)
  {
 
    float angle = sin(i+(n-2))*80; 
    float x = sin(radians(i))*(n/angle); 
 
    float leftLevel = mySound.left.level() * 20; 
    ellipse(i, i, leftLevel, leftLevel);
    rotateZ(n*-PI/3*0.05); 
 
    fill(R, G, B);
  }
 
  n += 0.008 ;
  n3 += speed2;
  n5 += speed2;
 
}
