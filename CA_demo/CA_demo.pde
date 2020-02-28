CA ca;

int scale = 8;

void setup() {
  
  frameRate(10);
  size(1200,800);
  background(0);
  int[] ruleset = {0,1,1,1,1,0,1,1};
  ca = new CA(ruleset);
}

void draw() {
  
  ca.render();
  ca.generate();
  
  if (ca.finished()) {
    //background(0);
    ca.randomize();
    ca.restart();
  }
}

void mousePressed() {

  //background(0);
  ca.randomize();
  ca.restart();
  
}
