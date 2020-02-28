// code modified from Daniel Shiffman's Nature of Code
// 


game my_game;

void setup() {
  
  frameRate(5);
  size(800, 800);
  my_game = new game();
}

void draw() {
  background(255);

  my_game.generate();
  my_game.display();
}

// reset board when mouse is pressed
void mousePressed() {
  my_game.init();
}
