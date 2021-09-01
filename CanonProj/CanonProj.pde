GameLogic gameLogic;

void setup() {
  size(1280,720);
  gameLogic = new GameLogic();
}

void draw() {
  background(255);
  gameLogic.Update();
  DrawGround();

}


void DrawGround(){
  rect(0,height-60,width,60);
  
}
