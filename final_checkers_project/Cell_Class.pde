//class for the grid
class Cell {  
  //x and y coordinates of the box 
  float x, y;
  //determines the size of each box
  float w, h;
  //determines the color of each box
  color basecolor;
  //checks to see whether the box is black or white
  boolean colorcheck;
  //checks to see if the box is occupied or not occupied
  boolean occupied;

  Cell (float tx, float ty) {
    x=tx;
    y=ty;
    w=width/cols;
    h=height/rows;
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
    //all of the boxes without checkers start out unoccupied
    occupied=false;
  }
  //displays grid
  void display() {
    //fills the boxes with the preset color determined in the constructor
    fill(basecolor);
    //creates the grid to be displayed
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
  //determines whether square is occupied by a checker, if there is a checker in the square then occupied is considered to be true
  void isOccupied(Checker a) {
    if (x==a.x && y==a.y) {
      occupied=true;
    }
  }
}
