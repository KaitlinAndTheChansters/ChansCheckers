//these booleans determine whether the start or instruction buttons are pressed
boolean instructions=false;
boolean start = false;
//this boolean determines if the game has ended (i.e. if there is a winner)
boolean winner = false;
//this determines the initial amount of checkers for each side
int count = 12;
//defines columns and rows of the 2D array that makes the board
int cols=8;
int rows=8;
//determines the size of each square in the grid
int w = width/cols;
int h = height/rows;
//creates two separate arrayLists for each set of chcekers
ArrayList<Checker>checkers = new ArrayList<Checker>();
ArrayList<Checker>checkers2 = new ArrayList<Checker>();
//Creates the 2D array for the board
Cell[][] board = new Cell[cols][rows];  
void setup() {   
  //the reset function is the same as the function that would create the grid, so it is simply called here in lieu of a board creating code
  reset();
  //creates the intial checkers
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
  //displays initial title screen
  displaytitle();
  //if the instructions button is selected, it will display the instructins
  if (instructions==true&&start==false) {
    displayinstructions();
  }
  //if the start button is pressed, it will run the program which is below
  if (start==true) {
    //displays the board and creates the check mouse function for selecting squares and pieces
    background(126, 183, 255);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].display();
        board[i][j].check(mouseX, mouseY);
      }
    }
    //runs winner function
    winner();
    //displays and moves the blue checkers, also determines if they occupy a square
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
    //displays and moves the red checkers, also determines if they occupy a square
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
    //if there is a winner, the program will not run until a key is pressed and the program is restarted
    if (winner==true) {
      noLoop();
    }
  }
}
//At the title screen, this determines which programs to run when the mousepresses certain buttons
void mousePressed () {
  //if the title screen is being displayed
  if (start==false&&instructions==false) {
    //if the the instructions button is pressed
    if ((mouseX > width/2-20 && mouseX < width/2+280) && (mouseY > height-300 && mouseY < height-200)) {
      instructions = true;
    }
    //if the start button is pressed
    if  ((mouseX > 65 && mouseX < 265) && (mouseY > height-300 && mouseY < height-200)) {
      start = true;
    }
  }
}
//This resets the board every move so that the occupy function refreshes.
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
//This restarts the game after a winner is declared
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
  //if a key is pressed the void draw will run again
  loop();
  //if there is a winner, the winner boolean will be reset to false.  Then the board will reset.
  if (winner==true) {
    winner=false;
    reset();
    restart();
  }
  //if a blue checker is selected and a key is pressed, the selected piece is removed
  for (int i = 0;i<checkers.size();i++) {
    Checker c = checkers.get(i);
    if (c.selected==true) {
      checkers.remove(i);
      reset();
    }
  }
  //if a red checker is selected and a key is pressed, the selected piece is removed
  for (int j = 0; j<checkers2.size(); j++) {
    Checker c=checkers2.get(j);
    if (c.selected==true) {
      checkers2.remove(j);
      reset();
    }
  }
}
//This determines who the winner is.  If the opponent has 0 checkers left on the board, they are considered to be the loser.
//The oppenent is then declared the winner 
void winner () {
  if (checkers.size()==0) {
    textSize(100);
    fill(0, 0, 255);
    text("BLUE WINS", width/10, height/2);
    winner=true;
  }
  if (checkers2.size()==0) {
    textSize(100);
    fill(255, 0, 0);
    text("RED WINS", width/10, height/2);
    winner=true;
  }
}
//this function displays the instructions. The instructions are only displayed if the button "instructions" is clicked.
//this is controlled by a boolean called instructions
void displayinstructions() {
  if (instructions == true) {
    background (124, 195, 255);
    if (keyPressed) {
      instructions = false;
    }
    textSize(20);
    text ("This is a two player game of checkers! Turns will be taken \nbetween you and your opponent. The goal is to jump as many \nof your opponent's pieces as possible. When one of your \npieces reaches the opposite side of the board, it will change \ncolor (pink or light blue) and become a king. Kings can move \nbackwards and forwards. \nTo select a piece, left click on it. To deselect a piece, right \nclick on an empty square. \nTo remove a piece after it has been jumped, select the piece \nand press any key. \nTo restart the game, press any key on the keyboard. \nHave fun and may the odds be ever in your favor.", 5, 25);
    text("Press any key to return to the menu", 5, height-20);
  }
}

//This function displays the initial title screen
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


