class CA {
  
  int [] cells;
  int generation;
  int[] ruleset;
  color[] colors1 = {color(219,209,180),color(219,202,105),color(189,208,156),color(71,75,22),color(58,75,22),color(75,78,25),color(62,78,25),color(133,141,17),color(102,141,60),color(44,56,16),color(154,164,20),color(64,79,36)};
  color[] colors2 = {color(166,145,80), color(177,157,94), color(186,168,111), color(194,178,128), color(202,188,145), color(211,199,162), color(219,209,180)};
  
  
  CA(int[] r) {
    ruleset = r;
    cells = new int[width/scale];
    restart();
  }
  
  CA() {
    scale = 1;
    cells = new int[width/scale];
    
    randomize();
    restart();
  }
  
  void setRules(int[] r) {
    ruleset = r; 
  }
  
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }
  
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;   
    generation = 0;
  }
  
  void generate() {
    
    int[] nextgen = new int[cells.length];
    
    for (int i = 1; i < cells.length-1; i++) {
      
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    
    cells = nextgen;
    generation++;
  }
  
  int rules (int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  void render() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(colors1[int(random(colors1.length))]);
      } else {
        fill(colors2[int(random(colors2.length))]);
      }
      stroke(0);
      rect(i*scale, generation*scale, scale, scale);
    }
  }
  
  boolean finished() {
    
    if (generation > height/scale) {
      return true; 
    } else {
      return false; 
    } 
  }
}
