class Checker {
  //x and y coordinate of the checker
  float x, y;
  //size of the checker
  float d;
  //display color of the checker
  color c;
  //regular color of the checker
  color basecolor;
  //color of the checker when it is selected
  color highlightcolor;
  //determines whether a piece is selected or not
  boolean selected;
  //determines whether a piece has become a king or not
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
    //all pieces are not initially selected and are not kings
    selected=false;
    king=false;
  }
  //displays the checkers
  void display () {
    //fills the checker with the desired color
    fill(c);
    //displays checkers  
    ellipse(x+d/2, y+d/2, d, d);
  }
  //determines whether a checker is clicked on,if the checker is clicked on the color changes and it is selected
  void check () {
    if (mousePressed&&selected==false) {
      //if the mouse is clicked within the area of the checker the color is changed to the highlightcolor and the checker is considered to be selected
      if (dist(x+d/2, y+d/2, mouseX, mouseY)<d/2) {
        c=highlightcolor;
        selected=true;
      } 
      //otherwise the checker is not selected and the color remains the same
      else {
        c=basecolor;
      }
    }
  }
  //function for determining how red checkers will move
  void movered () {
    //if the mouse is pressed and the piece is selected the function will run
    if (mousePressed&&selected==true) {
      //if the right mouse button is clicked, the piece will be de-selected
      if (mouseButton==RIGHT) {
        selected=false;
      }
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          //the if statements checks to see where the mouseX and mouseY are, then checks to make sure the piece is a red piece, that the square the piece
          //is moving to is a white square, and the box the checker is moving to is clicked with the left mouseButton. the checker will move onto the next if
          //statement which is described below
          if (board[i][j].check(mouseX, mouseY)&&(basecolor==color(255, 0, 0)||basecolor==color(255, 0, 255))&&board[i][j].colorcheck==false&&mouseButton==LEFT) {       
            //if the square the checker is moving to is unoccupied then the checker will move to that square
            if (board[i][j].occupied==false) {
              //the checker will be moved to that square
              x=board[i][j].x;
              y=board[i][j].y;    
              //the board will be recreated so that the occupy function is reset
              reset();
            }
            //if the checker reaches the end of the board, the king boolean becomes true and the color changes to magenta.
            //if the king boolean is true, the piece will continue to be magenta
            else if (y==board[7][7].y||king==true) {
              basecolor=color(255, 0, 255);
              if (board[i][j].occupied==false) {
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
  //function for determining how blue checkers will move, see more details above 
  void moveblue() {
    if (mousePressed&&selected==true) {
      if (mousePressed&&mouseButton==RIGHT) {
        selected=false;
      }
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          if (board[i][j].check(mouseX, mouseY)&&(basecolor==color(0, 0, 255)||basecolor==color(0, 255, 255))&&board[i][j].colorcheck==false&&mouseButton==LEFT) {        
            if (board[i][j].occupied==false) {
              x=board[i][j].x;
              y=board[i][j].y;    
              reset();
            }
            else if (y==board[0][0].y||king==true) {
              basecolor=color(0, 255, 255);
              if (board[i][j].occupied==false) {
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

