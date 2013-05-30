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
  checkers [0] = new Checker (200, 0, w, h);
  checkers [1] = new Checker (350, 0, w, h);
  checkers [2] = new Checker (500, 0, w, h);
  checkers [3] = new Checker (650, 0, w, h);
  //third row red
  checkers [4] = new Checker (200, 150, w, h);
  checkers [5] = new Checker (350, 150, w, h);
  checkers [6] = new Checker (500, 150, w, h);
  checkers [7] = new Checker (650, 150, w, h);
  //second row red
  checkers [8] = new Checker (275, 75,w,h);
  checkers [9] = new Checker (425, 75,w,h);
  checkers [10] = new Checker (575, 75, w, h);
  checkers [11] = new Checker (725,75,w,h);
  //first row blue
  checkers [12] = new Checker (200, height-75,w,h);
  checkers [13] = new Checker (350, height-75, w, h);
  checkers [14] = new Checker (500, height-75, w, h);
  checkers [15] = new Checker (650, height-75, w, h);
  //third row blue 
  checkers [16] = new Checker (200, height-225,w,h);
  checkers [17] = new Checker (350, height-225, w, h);
  checkers [18] = new Checker (500, height-225, w, h);
  checkers [19] = new Checker (650, height-225, w, h);
  //second row blue
  checkers [20] = new Checker (275, height-150,w,h);
  checkers [21] = new Checker (425, height-150,w,h);
  checkers [22] = new Checker (575, height-150, w, h);
  checkers [23] = new Checker (725,height-150,w,h);
  
}

void draw () {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].display();
    }
  }
  for (int i = 0; i<count;i++) {
    checkers[i].display();
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
    fill(255);
    rect(x, y, w, h);
    if (state==0) {
    }
    if (state==1) {
      fill (0, 0, 255);
      ellipse(x+w/2, y+h/2, w, h);
    }
    if (state==2) {
      fill (255, 0, 0);
      ellipse(x+w/2, y+h/2, w, h);
    }
  }
}


class Checker {
  float x, y;
  float w, h;
  color c;

  Checker (float tx, float ty, float tw, float th) {
    x=tx;
    y=ty;
    w=th;
    h=th;
    if (y<height/2) {
      c=color (255, 0, 0);
    }
    else {
      c=color (0, 0, 255);
    }
  }

  void display () {
    fill (255, 0, 0);
    ellipse(x+w/2, y+h/2, w, h);
  }
}

