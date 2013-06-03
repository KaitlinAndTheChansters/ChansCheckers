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
    checkers[i].move();
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
    } else if (x%2>0 && y%2==0) {
      fill (0);
    } else {
      fill (255);
    }
    rect(x, y, w, h);
  }
  boolean check(int mx, int my) {
    if (mx>x && mx<x+w && my>y && my<y+h) {
      return true;
    } else {
      return false;
    }
  }
}


class Checker {
  float x, y;
  float d;
  color c;
  color basecolor;
  color highlightcolor;
  boolean selected;

  Checker (float tx, float ty) {
    x=tx;
    y=ty;
    d=75;
    if (y<height/2) {
      basecolor=color (255, 0, 0);
    } else {
      basecolor=color (0, 0, 255);
    }
    c=basecolor;
    highlightcolor= color(0, 255, 0);
    selected=false;
  }

  void display () {
    fill (c);
    ellipse(x+d/2, y+d/2, d, d);
  }
  void check () {
    if (mousePressed&&selected==false) {
      if (dist(x+d/2, y+d/2, mouseX, mouseY)<d/2) {
        c=highlightcolor;
        selected=true;
      } else {
        c=basecolor;
      }
    }
  }
  void move () {
    if (mousePressed&&selected==true) {
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          if (board[i][j].check(mouseX, mouseY)) {
            x=board[i][j].x;
            y=board[i][j].y;
//            selected=false;
          }
        }
      }
      if (mousePressed&&mouseButton==RIGHT) {
        selected=false;
      }
    }
  }
}

