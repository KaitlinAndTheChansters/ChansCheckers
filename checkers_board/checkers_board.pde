int cols=8;
int rows=8;
Cell[][] board = new Cell[cols][rows];  //creates 2D array
void setup() {   
  size(1000, 600);
  int w = (600)/cols;
  int h = (height)/rows;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*w+200, j*h, w, h, 0);
    }
  }
}  
void draw () {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].display();
    }
  }
}

class Cell {   
  float x, y;
  float w, h;
  int state;
  int clickcount;

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

