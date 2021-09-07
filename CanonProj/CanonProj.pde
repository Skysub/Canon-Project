GameLogic gameLogic;
PImage backdrop;

void setup() {
  size(1280, 720);
  frameRate(60);
  gameLogic = new GameLogic();
  backdrop = loadImage("HillsBackdrop.JPG");
}

void draw() {
  image(backdrop, 0, 0, width, height);
  gameLogic.Update();
  DrawGround();
  DrawControls();
}


void DrawGround() {
  rect(0, height-60, width, 60);
}

void DrawControls() {
  rect(1100, 0, 180, 150);
  textSize(20);
  fill(0,0,0);
  text("ENTER to begin",1125,40);
  text("← and → to aim",1118,80);
  text("SPACEBAR to fire",1110,120);
}

void keyPressed() {
  gameLogic.HandleInput(keyCode, true);
}

void keyReleased() {
  gameLogic.HandleInput(keyCode, false);
}
