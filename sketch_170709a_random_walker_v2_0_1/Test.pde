class Test {
  
  Test() {
  }
  
  void randomNumTest(int iter) {
  int dir;
  int right = 0;
  int up = 0;
  int left = 0;
  int down = 0;
  for (int i = 0; i < iter; i++) {
    dir = w.choose();
    switch (dir) {
    case 0:
      right++;
      break;
    case 1:
      up++;
      break;
    case 2:
      left++;
      break;
    case 3:
      down++;
      break;
    }
  }
  println();
  println("right ", right);
  println("up ", up);
  println("left ", left);
  println("down ", down);
  }
}