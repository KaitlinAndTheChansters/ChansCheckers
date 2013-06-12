int count = 24;
int cols=8;
int rows=8;
int w = (600)/cols;
int h = (height)/rows;
ArrayList<Checker>checkers = new ArrayList<Checker>();
ArrayList<Checker>checkers2 = new ArrayList<Checker>();
Cell[][] board = new Cell[cols][rows];  
void setup() {   
  size(600, 600);
  int w = (600)/cols;
  int h = (height)/rows;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*w, j*h);
    }
  }
  for (int x = 0;x<cols;x++) {
    for (int y = 0; y<rows;y++) {
      if ((y%2==0 && x%2 == 0)||(y%2==1 && x%2 == 1)) {            
        if (y<=2) {              
          checkers.add(new Checker(board[x][y].x, board[x][y].y));
        }            
        if (y>=5) {              
          checkers2.add(new Checker(board[x][y].x, board[x][y].y));
        }
      }
    }
  }
}

void draw () {
  background(126, 183, 255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j].display();
      board[i][j].check(mouseX, mouseY);
    }
  }
  for (int i = 0; i<count/2; i++) {
    Checker a = checkers.get(i);
    Checker b = checkers2.get(i);
    a.display();
    a.check();
    a.movered();
    a.moveblue();
    b.display();
    b.check();
    b.movered();
    b.moveblue();
    for (int x = 0; x < cols; x++) {          
      for (int y = 0; y < rows; y++) {   
        board[x][y].isOccupied(a);
        board[x][y].isOccupied(b);
      }
    }
  }
}


void keyPressed () {
  loop();
}
