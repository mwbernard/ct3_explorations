// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pendulum

// A simple pendulum simulation
// Given a pendulum with an angle theta (0 being the pendulum at rest) and a radius r
// we can use sine to calculate the angular component of the gravitational force.

// Gravity Force = Mass * Gravitational Constant;
// Pendulum Force = Gravity Force * sine(theta)
// Angular Acceleration = Pendulum Force / Mass = gravitational acceleration * sine(theta);

// Note this is an ideal world scenario with no tension in the 
// pendulum arm, a more realistic formula might be:
// Angular Acceleration = (g / R) * sine(theta)

// For a more substantial explanation, visit:
// http://www.myphysicslab.com/pendulum1.html 
import processing.sound.*;
SoundFile click;


Pendulum p;

boolean left = false;
boolean lastLeft = false;

void setup() {
  size(1300,800);
  // Make a new Pendulum with an origin position and armlength
  p = new Pendulum(new PVector(width/2,0),600);
  
  click = new SoundFile(this, "250552__druminfected__metronome.wav");

}

void draw() {

  background(0);
  
  stroke(255,0,0,90);
  line(width/2,0,width/2,height);
  
  p.go();
  
  if (p.position.x < width/2) {
    left = true;
  }else{
    left = false;
  }
  
  if (left != lastLeft) {
    noStroke();
    fill(255);
    ellipse(100,height - 100,50,50);
    ellipse(width - 100, height - 100, 50,50);
    click.play();
  }
  
  lastLeft = left;
}

void mousePressed() {
  p.clicked(mouseX,mouseY);
}

void mouseReleased() {
  p.stopDragging();
}

void keyPressed() {
  
  switch(key){
  
    case 'z':
      p.r -= 10;
      break;
      
    case 'x':
      p.r += 10;
      break;


  }
}
