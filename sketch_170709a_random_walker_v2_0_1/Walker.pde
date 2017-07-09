class Walker {

  PVector pos;
  color c;
  int step = 8;
  ArrayList<PVector> map;

  Walker () {
    reset();
  }

  void reset() {
    pos = new PVector (width/2, height/2);
    map = new ArrayList<PVector>();
    c = (200);
    noStroke();
  }
  void dig () {
    PVector newPos = new PVector(pos.x, pos.y);
    map.add(newPos);
  }

  void move (int dir) {
    switch (dir) {
    case 0: // move right
      pos.x += step;
      break;
    case 1: // move up
      pos.y += step;
      break;
    case 2: // move left
      pos.x -= step;
      break;
    case 3: // move down
      pos.y -= step;
      break;
    }
  }

  int choose () {
    
    int dir = 0;

    boolean onRightEdge = true;
    boolean onTopEdge = true;
    boolean onLeftEdge = true;
    boolean onBottomEdge = true;
    
    boolean proceed = false;
    
    if (pos.x < width*0.97) onRightEdge = false;
    if (pos.x > width*0.03) onLeftEdge = false;
    if (pos.y < height*0.97) onTopEdge = false;
    if (pos.y > width*0.03) onBottomEdge = false;
    
    while (!proceed) {
      dir = floor(random(0, 4));
      if (!onRightEdge && (dir == 0)) proceed = true;
      if (!onLeftEdge && (dir == 2)) proceed = true;
      if (!onTopEdge && (dir == 1)) proceed = true;
      if (!onBottomEdge && (dir == 3)) proceed = true;
    }
    return dir;
  }

  void mine(int iterations) {
    dig();
    for (int i = 0; i < iterations; i++) {
      this.move(choose());
      dig();
    }
  }

  void drawCenter() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, step, step);
  }
  
  void render() {
    // needs for loop to run through the map array with following for each element
    fill(c);
    rectMode(CENTER);
    for (PVector s : map ){
      rect(s.x, s.y, step, step);
    }
  }

  /// EOF ///
}