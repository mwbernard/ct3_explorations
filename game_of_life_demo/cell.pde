class Cell {
  
  color[] colors1 = {color(219,209,180),color(219,202,105),color(189,208,156),color(71,75,22),color(58,75,22),color(75,78,25),color(62,78,25),color(133,141,17),color(102,141,60),color(44,56,16),color(154,164,20),color(64,79,36)};
  color[] colors2 = {color(166,145,80), color(177,157,94), color(186,168,111), color(194,178,128), color(202,188,145), color(211,199,162), color(219,209,180)};
  
  
  float x, y;
  float w;

  int state;
  int previous;

  Cell(float x_, float y_, float w_) {
    x = x_;
    y = y_;
    w = w_;
    
    state = int(random(2));
    previous = state;
  }
  
  void savePrevious() {
    previous = state; 
  }

  void newState(int s) {
    state = s;
  }

  void display() {
    if (previous == 0 && state == 1) fill(colors1[int(random(colors1.length))]);
    else if (state == 1) fill(colors1[int(random(colors1.length))]);
    else if (previous == 1 && state == 0) fill(colors1[int(random(colors1.length))]);
    else fill(colors2[int(random(colors2.length))]); 
    stroke(0);
    rect(x, y, w, w);
  }
}
