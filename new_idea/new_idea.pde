PImage kingimage;
boolean instructions=false;
boolean start = false;
boolean restart =false;
boolean winner = false;
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
  kingimage = loadImage("kaitlin.jpg");
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
  if (instructions==false&&start==false) {
    displaytitle();
  }
  if (instructions==true&&start==false) {
    displayinstructions();
  }
  if (start==true) {
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
    if (winner==true) {
      noLoop();
    }
  }
}

void mousePressed () {
  if (start==false&&instructions==false) {
    if ((mouseX > width/2-20 && mouseX < width/2+280) && (mouseY > height-300 && mouseY < height-200)) {
      instructions = true;
    }
    if  ((mouseX > 65 && mouseX < 265) && (mouseY > height-300 && mouseY < height-200)) {
      start = true;
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

void restart () {
  for (int i = 0;i<checkers.size();i++) {
    Checker c = checkers.get(i);
    checkers.remove(i);
  }
  for (int j = 0; j<checkers2.size(); j++) {
    Checker c=checkers2.get(j);
    checkers2.remove(j);
  }
  reset();
  setup();
}
void keyPressed() {
  loop();
  if (winner==true) {
    winner=false;
    reset();
    restart();
  }
  for (int i = 0;i<checkers.size();i++) {
    Checker c = checkers.get(i);
    if (c.selected==true) {
//      print("I'M RED");
      checkers.remove(i);
      reset();
    }
  }
  for (int j = 0; j<checkers2.size(); j++) {
    Checker c=checkers2.get(j);
    if (c.selected==true) {
//      print("I'M BLUE");
      checkers2.remove(j);
      reset();
    }
  }
}

void winner () {
  for (int i = 0; i<checkers.size();i++) {
    Checker a = checkers.get(i);
    if (checkers.size()==0) {
      textSize(100);
      fill(0, 0, 255);
      text("BLUE WINS", width/10, height/2);
//      print("BLUE WINS");
      winner=true;
    }
  }
  for (int i =0;i<checkers2.size();i++) {
    Checker b = checkers2.get(i);
    if (checkers2.size()==0) {
      textSize(100);
      fill(255,0,0);
      text("RED WINS", width/10, height/2);
//      print("RED WINS");
      winner=true;
    }
  }
}

void displayinstructions() {
  if (instructions == true) {
    background (124, 195, 255);
    if (keyPressed) {
      instructions = false;
    }
    textSize(20);
    text ("This is a two player game of checkers! Turns will be taken", 5, 25);
    text ("between you and your opponent. The goal is to jump as many", 5, 50);
    text ("of your opponent's pieces as possible. When one of your", 5, 75);
    text ("pieces reaches the opposite side of the board, it will change", 5, 100);
    text ("color (pink or light blue) and become a king. Kings can move", 5, 125);
    text ("backwards and forwards.", 5, 150);
    text ("To select a piece, left click on it. To deselect a piece, right", 5, 175);
    text ("click on it", 5, 200);
    text ("To remove a piece, select the piece and press any key", 5, 225);
    text ("To restart the game, press any key on the keyboard.", 5, 250);
    text ("Have fun and may the odds be ever in your favor.", 5, 275);
    text ("Press any key to return to the menu", 5, height-20);
  }
}


void displaytitle () {
  size(600, 600);
  background (124, 195, 255);
  fill (0);
  textSize (50);
  text ("Chan's Checkers!", 100, height/3);
  strokeWeight (5);
  fill (255, 0, 0);
  rect (65, height-300, 200, 100);
  fill (0, 0, 255);
  rect (width/2-20, height-300, 300, 100);
  fill (0);
  textSize (50);
  text ("Start", 100, height-230);
  text ("Instructions", width/2-10, height-230);
}

