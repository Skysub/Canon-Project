import processing.sound.*;

GameLogic gameLogic;
PImage backdrop;
PImage target;

void setup() {
  size(1280, 720);
  frameRate(144);
  gameLogic = new GameLogic();
  backdrop = loadImage("HillsBackdrop.JPG");
  target = loadImage("Target.png");
}

void draw() {
  imageMode(CORNER);
  image(backdrop, 0, 0, width, height);
  //background(240);
  gameLogic.Update();
  DrawGround();
  DrawControls();
}


void DrawGround() {
  fill(220); //græs-farve?
  rect(0, height-60, 125, 60);
}

void DrawControls() {
  rect(1070, 0, 210, 190);
  textSize(20);
  fill(0,0,0);
  text("ENTER to begin",1125,40);
  text("← and → to aim",1118,80);
  text("SPACEBAR to fire",1110,120);
  text("P to enable particles", 1078,160);
}

void keyPressed() {
  gameLogic.HandleInput(keyCode, true);
}

void keyReleased() {
  gameLogic.HandleInput(keyCode, false);
}
