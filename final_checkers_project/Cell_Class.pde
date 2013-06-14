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
//    if (occupied) {
//      basecolor=color(255,255,0);
//    }
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
