int count = 24;
int cols=8;
int rows=8;
int w = (600)/cols;
int h = (height)/rows;
ArrayList<Checker>checkers = new ArrayList<Checker>();
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
          checkers.add(new Checker(board[x][y].x, board[x][y].y));
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
  for (int i = 0; i<count; i++) {
    Checker c = checkers.get(i);
    c.display();
    c.check();
    c.movered();
    c.moveblue();
    for (int x = 0; x < cols; x++) {          
      for (int y = 0; y < rows; y++) {   
        board[x][y].isOccupied(c);
      }
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
  boolean king;

  Checker (float tx, float ty) {
    x=tx;
    y=ty;
    d=75;
    //determines the initial color of the checker
    if (y<height/2) {
      basecolor=color (255, 0, 0);
    } 
    else {
      basecolor=color (0, 0, 255);
    }
    c=basecolor;
    highlightcolor= color(0, 255, 0);
    selected=false;
    king=false;
  }
  //displays the checkers
  void display () {
    fill(c);
    if (king==true&&basecolor==color(255, 0, 0)) {
      basecolor=color(255, 0, 255);
    }  
    if (king==true&&basecolor==color(0,0,255)) {
      basecolor=color(0,255,255);
    }
    ellipse(x+d/2, y+d/2, d, d);
  }
  //determines whether a checker is clicked on,if the checker is clicked on the color changes and it is selected
  void check () {
    if (mousePressed&&selected==false) {
      if (dist(x+d/2, y+d/2, mouseX, mouseY)<d/2) {
        c=highlightcolor;
        selected=true;
      } 
      else {
        c=basecolor;
      }
    }
  }
  void movered () {
    if (mousePressed&&selected==true) {
      if (mousePressed&&mouseButton==RIGHT) {
        selected=false;
      }
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          //determines if red checkers can move and where they move to
          if (board[i][j].check(mouseX, mouseY)&&(basecolor==color(255, 0, 0)||basecolor==color(255, 0, 255))&&(mouseX<x+225&&mouseX>x-125)&&board[i][j].colorcheck==false&&mouseButton==LEFT) {        
            if (y==board[7][7].y||king==true) {
              basecolor=color(255,0,255);
              if (board[i][j].occupiedstate()==false) {
                king=true;
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
              }
            }
            else if (y!=board[7][7].y&&(mouseY>y&&mouseY<y+225)&&king==false) {
              if (board[i][j].occupiedstate()==false) {
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
              }
            }
          }
        }
      }
    }
  }
  void moveblue() {
    if (mousePressed&&selected==true) {
      if (mousePressed&&mouseButton==RIGHT) {
        selected=false;
      }
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          if (board[i][j].check(mouseX, mouseY)&&(basecolor==color(0, 0, 255)||basecolor==color(0, 255, 255))&&(mouseX<x+225&&mouseX>x-125)&&board[i][j].colorcheck==false&&mouseButton==LEFT) {        
            if (y==board[0][0].y||king==true) {
              basecolor=color(0,255,255);
              if (board[i][j].occupiedstate()==false) {
                king=true;
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
              }
            }
            else if (y!=board[0][0].y&&(mouseY<y&&mouseY>y-225)&&king==false) {
              if (board[i][j].occupiedstate()==false) {
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
              }
            }
          }
        }
      }
    }
  }
}

class Cell {   
  float x, y;
  float w, h;
  color basecolor;
  boolean colorcheck;
  boolean occupied;

  Cell (float tx, float ty) {
    x=tx;
    y=ty;
    w=(600)/cols;
    h=(height)/rows;
    //determines the colors of each square
    if (x%2==0 && y%2>0) {
      basecolor=color(0);
      colorcheck=true;
    } 
    else if (x%2>0 && y%2==0) {
      basecolor=color(0);
      colorcheck=true;
    }
    else {
      basecolor=color(255);
      colorcheck=false;
    }
    occupied=false;
  }
  //displays grid
  void display() {
    fill(basecolor);
    rect(x, y, w, h);
  }
  //checks to see where mouse is
  boolean check(int mx, int my) {
    if (mx>x && mx<x+w && my>y && my<y+h) {
      return true;
    } 
    else {
      return false;
    }
  }
  //determines whether square is occupied by a checker
  void isOccupied(Checker a) {
    if (x==a.x && y==a.y) {
      occupied=true;
    }
  }
  //makes occupied boolean into a function so it can be referenced by void move in checker class
  boolean occupiedstate () {
    if (occupied==true) {
      return true;
    }
    else {
      return false;
    }
  }
}


