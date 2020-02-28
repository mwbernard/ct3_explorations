import processing.sound.*;
SoundFile click;


float r1 = 200;
float r2 = 100;
float m1 = 20;
float m2 = 40;
float a1 = PI/4;
float a2 = PI/2;
float a1v = 0;
float a2v = 0;

float g = 1;

boolean lastLeft = false;
boolean left = false;

void setup() {
  size(1000,600);
  
  click = new SoundFile(this, "250552__druminfected__metronome.wav");
  
}

void draw() {
  
  float n1 = -g * (2 * m1 + m2) * sin(a1);
  float n2 = -m2 * g * sin(a1-2*a2);
  float n3 = -2*sin(a1-a2)*m2;
  float n4 = a2v*a2v*r2+a1v*a1v*r1*cos(a1-a2);
  
  float d = r1*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  float a1a = ((n1 + n2 + n3)*n4) / d;
  
  n1 = 2 * sin(a1-a2);
  n2 = (a1v*a1v*r1*(m1+m2));
  n3 = g * (m1+m2) * cos(a1);
  n4 = a2v*a2v*r2*m2*cos(a1-a2);
  
  d = r2*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  float a2a = (n1*(n2+n3+n4)) / d;
  
  background(0);
  stroke(255);
  strokeWeight(2);
  
  translate(width/2,50);
  
  float x1 = r1*sin(a1);
  float y1 = r1*cos(a1);
  
  float x2 = x1+r2*sin(a2);
  float y2 = y1+r2*cos(a2);
  
  a1v += a1a;
  a2v += a2a;
  a1 += a1v;
  a2 += a2v;
  
  a1v *= .9999;
  a2v *= .9999;
  
  line(0,0,x1,y1);
  fill(255);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(255);
  ellipse(x2,y2,m2,m2);
  
  if (x1 < 0) {
    left = true;
  } else {
    left = false;
  }
  
  if (left != lastLeft) {
    click.play();
  }
  
  lastLeft = left;
}

void keyPressed() {
  
  switch(key){
  
    case 'z':
      r1 -= 10;
      break;
      
    case 'x':
      r1 += 10;
      break;
      
    case 'n':
      r2 -= 10;
      break;
      
    case 'm':
      r2 += 10;
  } 
  
}
