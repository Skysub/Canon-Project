Cannon cannon;

void setup() {
  size(1280,720);
    cannon = new Cannon(0.05);
}

void draw() {
  background(255);
  cannon.update();
  cannon.display();
  }
