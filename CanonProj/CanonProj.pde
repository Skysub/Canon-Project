GameLogic gameLogic;

void setup() {
  size(1280,720);
  gameLogic = new GameLogic();
}

void draw() {
  background(255);
  gameLogic.Update();

}
