import ddf.minim.*;
import ddf.minim.analysis.*;

PImage bg;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 200;
float rad = 70;
void setup()
{
  bg = loadImage("Image.png");
  size(1040,1040);
  minim = new Minim(this);
  player = minim.loadFile("music.wav");
  meta = player.getMetaData();
  beat = new BeatDetect();
  //player.loop();
  player.play();
  background(bg);
  //noCursor();
}

void draw()
{ 
  float t = map(mouseX, 0, width, 0, 1);
  beat.detect(player.mix);
  fill(#1A1F18, 01);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-1, 10);
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 70;
  ellipse(0, 0, 2*rad, 2*rad);
  stroke(-1, 50);
  int bsize = player.bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/bsize);
    float y = (r)*sin(i*2*PI/bsize);
    float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  for (int i = 0; i < bsize; i+=10)
  {
    float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();
  }
  endShape();
  if (flag)
 showMeta();
}


void showMeta() {
  int time =  meta.length();
  textSize(50);
  textAlign(CENTER);
  text( (int)(time/1000-millis()/1000)/60 + ":"+ (time/1000-millis()/1000)%60, -7, 21);
}

boolean flag =false;
void mousePressed() {
  if (dist(mouseX, mouseY, width/2, height/2)<150) flag =!flag;
}


//boolean sketchFullScreen() 
//{
//  return true;
//}

void keyPressed() {
  if(key=='x')exit();
  if(key=='s')saveFrame("RAK###.jpeg");
}
