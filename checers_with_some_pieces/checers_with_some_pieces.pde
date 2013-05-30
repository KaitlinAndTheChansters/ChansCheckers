int cols=8;
int rows=8;
int w = (600)/cols;
int h = (height)/rows;
Cell[][] board = new Cell[cols][rows];  
Checker [] checkers = new Checker [4];
void setup() {   
  size(1000, 600);
  int w = (600)/cols;
  int h = (height)/rows;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*w+200, j*h, w, h, 0);
    }
  }
  checkers [0] = new Checker (200,0, w, h);
  checkers [1] = new Checker (350,0,w,h);
  checkers [2] = new Checker (500,0,w,h);
  checkers [3] = new Checker (650,0,w,h);
}  
void draw () {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].display();
    }
  }
  for (int i = 0; i<4;i++) {
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

