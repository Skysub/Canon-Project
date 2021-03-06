import processing.sound.*;

GameLogic gameLogic;
PImage backdrop;
PImage target;
//int tOld = 0;

void setup() {
  size(1280,720);
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
  //println(1f/((millis()-tOld)/1000f));
  //tOld = millis(); //framerate
}


void DrawGround() {
  fill(220); //græs-farve?
  rect(-5, height-60, 128, 60);
}

void DrawControls() {

  rect(1078, 0, 206, 216);
  textSize(20);
  fill(0,0,0);
  text("ENTER to begin",1125,40);
  text("← and → to aim",1118,80);
  text("SPACEBAR to fire",1110,120);

  text("P to enable particles", 1084,200);
  text("↑↓ to change mode",1094,160);

}

void keyPressed() {
  gameLogic.HandleInput(keyCode, true);
}

void keyReleased() {
  gameLogic.HandleInput(keyCode, false);
}
