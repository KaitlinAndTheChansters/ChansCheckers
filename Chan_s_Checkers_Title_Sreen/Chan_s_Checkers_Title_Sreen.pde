boolean instructions=false;
boolean start = false;

void setup () {
  size (600, 600);
 }

void draw () {
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
    text ("To restart the game, press any key on the keyboard.", 5, 225);
    text ("Have fun and may the odds be ever in your favor.", 5, 250);
    text ("Press any key to return to the menu", 5, height-20);
 
  }
  if (start == true) {
    background (0, 255, 0);
    if (keyPressed) {
      start = false;
    }
    textSize (20);
    text ("Press any key to return to the menu", 25, 575);
  }
}

void mousePressed () {
  if ((mouseX > width/2-20 && mouseX < width/2+280) && (mouseY > height-300 && mouseY < height-200)) {
    instructions = true;
  }
  if  ((mouseX > 65 && mouseX < 265) && (mouseY > height-300 && mouseY < height-200)) {
    start = true;
  }
}


