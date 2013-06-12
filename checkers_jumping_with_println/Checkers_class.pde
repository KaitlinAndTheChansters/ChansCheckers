class Checker {
  float x, y;
  float d;
  color c;
  color basecolor;
  color highlightcolor;
  boolean selected;
  boolean king;
  boolean isDead;

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
  void checkisdead() {
    for (int i = 0; i < cols-1; i++) {
      for (int j = 0; j < rows-1; j++) {
        for (int k = count - 1; k>0; k--) {
          Checker c = checkers.get(k);

          if (c.x==board[i+1][j+1].x&&c.y==board[i+1][j+1].y) {
            isDead=true;
          }
          else {
            isDead=false;
          }
        }
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
                selected=false;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
              }
              if (board[i][j].x<=400) {
                println("HEY I'M RUNNING RIGHT!");
                if (board[i+1][j+1].occupiedstate()==true) {
                  println("STILL GOING RIGHT");
                  if (board[i+2][j+2].occupiedstate()==false) {
                    print("DO YOU WANNA JUMP RIGHT?");
                    selected=false;
                    x=board[i+2][j+2].x;
                    y=board[i+2][j+2].y;
                    isDead=true;
                  }
                }
              }
              if (board[i][j].x>=200&&board[i][j].y<=600) {
                println("HEY I'M RUNNING LEFT!");
                if (board[i-1][j+1].occupiedstate()==true) {
                  println("STILL GOING LEFT");
                  if (board[i-2][j+2].occupiedstate()==false) {
                    selected=false;
                    print("DO YOU WANNA JUMP LEFT?");
                    x=board[i-2][j+2].x;
                    y=board[i-2][j+2].y;
                  }
                }
              }
              else {
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
            if (y!=board[0][0].y&&(mouseY<y&&mouseY>y-225)&&king==false) {
              if (board[i][j].occupiedstate()==false&&king==false) {
                selected=false;
                x=board[i][j].x;
                y=board[i][j].y;    
                reset();
              }
              if (board[i][j].x<=400&&board[i][j].y<600) {
                println("HEY I'M RUNNING RIGHT!");
                if (board[i+1][j-1].occupiedstate()==true) {
                  println("STILL GOING RIGHT");
                  if (board[i+2][j-2].occupiedstate()==false) {
                    selected=false;
                    print("DO YOU WANNA JUMP RIGHT?");
                    x=board[i+2][j-2].x;
                    y=board[i+2][j-2].y;
                    isDead=true;
                  }
                }
              }
              if (board[i][j].x>=200) {
                println("HEY I'M RUNNING LEFT!");
                if (board[i-1][j-1].occupiedstate()==true) {
                  println("STILL GOING LEFT");
                  if (board[i-2][j-2].occupiedstate()==false) {
                    selected=false;
                    print("DO YOU WANNA JUMP LEFT?");
                    x=board[i-2][j-2].x;
                    y=board[i-2][j-2].y;
                    isDead=true;
                  }
                }
              }

              else if (y==board[0][0].y||king==true) {
                basecolor=color(0, 255, 255);
                if (board[i][j].occupiedstate()==false) {
                  king=true;
                  x=board[i][j].x;
                  y=board[i][j].y;    
                  reset();
                  selected=false;
                }
              }
            }
          }
        }
      }
    }
  }
}

