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
              println("selected");
              if (board[i][j].occupiedstate()==false&&king==false) {
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
                selected=false;
              }
              else if (board[i][j].x<=400) {
                println("HEY I'M RUNNING!");
                if (board[i+1][j+1].occupiedstate()==true) {
                  println("STILL GOING");
                  if (board[i+2][j+2].occupiedstate()==false) {
                    print("DO YOU WANNA JUMP RIGHT?");
                    x=board[i+2][j+2].x;
                    y=board[i+2][j+2].y;
                    noLoop();
                  }
                }
              }
              else if (board[i][j].x>=300) {
                if (board[i-1][j+1].occupiedstate()==true) {
                  if (board[i-2][j+2].occupiedstate()==false) {
                    print("DO YOU WANNA JUMP LEFT?");
                    x=board[i-2][j+2].x;
                    y=board[i-2][j+2].y;
                    noLoop();
                  }
                }
              }
              else {
              }
            }
            else if (y==board[7][7].y||king==true) {
              basecolor=color(255, 0, 255);
              if (board[i][j].occupiedstate()==false) {
                king=true;
                x=board[i][j].x;
                y=board[i][j].y;    
                setup();
                selected=false;
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
              basecolor=color(0, 255, 255);
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

