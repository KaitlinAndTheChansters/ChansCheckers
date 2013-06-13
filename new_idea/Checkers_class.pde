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
    if (king==true&&basecolor==color(0, 0, 255)) {
      basecolor=color(0, 255, 255);
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
      if (mouseButton==RIGHT) {
        selected=false;
      }
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          //determines if red checkers can move and where they move to
          if (board[i][j].check(mouseX, mouseY)&&(basecolor==color(255, 0, 0)||basecolor==color(255, 0, 255))&&(mouseX<x+225&&mouseX>x-125)&&board[i][j].colorcheck==false&&mouseButton==LEFT) {        
            if (y!=board[7][7].y&&(mouseY>y&&mouseY<y+225)) {
              println("red selected");
              if (board[i][j].occupiedstate()==false&&king==false) {
                selected=false;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
              }
            }
            else if (y==board[7][7].y||king==true) {
              basecolor=color(255, 0, 255);
              if (board[i][j].occupiedstate()==false) {
                selected=false;
                king=true;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
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
            if (y!=board[0][0].y&&(mouseY<y&&mouseY>y-225)) {
              print("blue selected");
              if (board[i][j].occupiedstate()==false&&king==false) {
                selected=false;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
              }
            }
            else if (y==board[0][0].y||king==true) {
              basecolor=color(0, 255, 255);
              if (board[i][j].occupiedstate()==false) {
                selected=false;
                king=true;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
              }
            }
          }
        }
      }
    }
  }
}

