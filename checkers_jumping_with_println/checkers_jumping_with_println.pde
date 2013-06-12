int count = 12;
int cols=8;
int rows=8;
int w = (600)/cols;
int h = (height)/rows;
ArrayList<Checker>checkers = new ArrayList<Checker>();
ArrayList<Checker>checkers2 = new ArrayList<Checker>();
Cell[][] board = new Cell[cols][rows];  
void setup() {   
  reset();
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
  for (int i = 0; i<checkers.size(); i++) {
    for (int j = 0; j<checkers2.size(); j++) {
      Checker red = checkers.get(i);
      Checker blue = checkers2.get(j);
      red.display();
      red.check();
      red.movered();
      red.moveblue();
      blue.display();
      blue.check();
      blue.movered();
      blue.moveblue();
      red.checkisdead();
      blue.checkisdead();
      for (int x = 0; x < cols; x++) {          
        for (int y = 0; y < rows; y++) {   
          board[x][y].isOccupied(red);
          board[x][y].isOccupied(blue);
        }
      }
    }
  }
}

void reset () {
  size(600, 600);
  int w = (600)/cols;
  int h = (height)/rows;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      board[i][j] = new Cell(i*w, j*h);
    }
  }
}

