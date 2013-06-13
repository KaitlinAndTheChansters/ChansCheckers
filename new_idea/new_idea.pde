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
  winner();
  for (int j = 0; j<checkers2.size(); j++) {
    Checker blue = checkers2.get(j);
    blue.display();
    blue.check();
    blue.movered();
    blue.moveblue();
    for (int x = 0; x < cols; x++) {          
      for (int y = 0; y < rows; y++) {   
        board[x][y].isOccupied(blue);
      }
    }
  }
  for (int i = 0; i<checkers.size(); i++) {
    Checker red = checkers.get(i);
    red.display();
    red.check();
    red.movered();
    red.moveblue();
    for (int x = 0; x < cols; x++) {          
      for (int y = 0; y < rows; y++) {   
        board[x][y].isOccupied(red);
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

void keyPressed() {
  for (int i = 0;i<checkers.size();i++) {
    Checker c = checkers.get(i);
    if (c.selected==true) {
      print("I'M RED");
      checkers.remove(i);
    }
  }
  for (int j = 0; j<checkers2.size(); j++) {
    Checker c=checkers2.get(j);
    if (c.selected==true) {
      print("I'M BLUE");
      checkers2.remove(j);
    }
  }
}

void winner () {
  for (int i = 0; i<checkers.size();i++) {
    Checker a = checkers.get(i);
    if (checkers.size()==1) {
      print("BLUE WINS");
    }
  }
  for (int i =0;i<checkers2.size();i++) {
    Checker b = checkers2.get(i);
    if (checkers2.size()==1) {
      print("RED WINS");
    }
  }
}

