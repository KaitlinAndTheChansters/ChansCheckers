int count = 24;
int cols=8;
int rows=8;
int w = (600)/cols;
int h = (height)/rows;
Cell[][] board = new Cell[cols][rows];  
Checker [] checkers = new Checker [count];
void setup() {   
  size(1000, 600);
  int w = (600)/cols;
  int h = (height)/rows;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*w+200, j*h, w, h, 0);
    }
  }
  //first row red
  checkers [0] = new Checker (200, 0);
  checkers [1] = new Checker (350, 0);
  checkers [2] = new Checker (500, 0);
  checkers [3] = new Checker (650, 0);
  //second row red
  checkers [8] = new Checker (275, 75);
  checkers [9] = new Checker (425, 75);
  checkers [10] = new Checker (575, 75);
  checkers [11] = new Checker (725, 75);
  //third row red
  checkers [4] = new Checker (200, 150);
  checkers [5] = new Checker (350, 150);
  checkers [6] = new Checker (500, 150);
  checkers [7] = new Checker (650, 150);
  //first row blue
  checkers [12] = new Checker (275, height-75);
  checkers [13] = new Checker (425, height-75);
  checkers [14] = new Checker (575, height-75);
  checkers [15] = new Checker (725, height-75);
  //second row blue
  checkers [20] = new Checker (200, height-150);
  checkers [21] = new Checker (350, height-150);
  checkers [22] = new Checker (500, height-150);
  checkers [23] = new Checker (650, height-150);
  //third row blue 
  checkers [16] = new Checker (275, height-225);
  checkers [17] = new Checker (425, height-225);
  checkers [18] = new Checker (575, height-225);
  checkers [19] = new Checker (725, height-225);
}

void draw () {
  background(126, 183, 255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].display();
    }
  }
  for (int i = 0; i<count;i++) {
    checkers[i].display();
    checkers [i].check();
  }
}

class Cell {   
  float x, y;
  float w, h;
  int state;

  Cell (float tx, float ty, float tw, float th, int ts) {
    x=tx;
    y=ty;
    w=tw;
    h=th;
    state=ts;
  }

  void display() {
    if (x%2==0 && y%2>0) {
      fill (0);
    }
    else if (x%2>0 && y%2==0) {
      fill (0);
    }
    else {
      fill (255);
    }
    rect(x, y, w, h);
  }
}


class Checker {
  float x, y;
  float w, h;
  color c;

  Checker (float tx, float ty) {
    x=tx;
    y=ty;
    w=(600)/cols;
    h=(height)/rows;
    if (y<height/2) {
      c=color (255, 0, 0);
    }
    else {
      c=color (0, 0, 255);
    }
  }

  void display () {
    fill (c);
    ellipse(x+w/2, y+h/2, w, h);
  }
  void check () {
    if ((dist(x,y,mouseX,mouseY)<w/2+h/2)&&mousePressed) {
      print("KAITLIN AND THE CHANSTERS");
      c=color (0,255,0);
    }
    else {}
  }
}


