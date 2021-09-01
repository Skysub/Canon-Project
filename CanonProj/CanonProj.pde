Cannon cannon;

void setup() {
  size(1280,720);
    cannon = new Cannon(1.35*PI);
}

void draw() {
  background(255);
  cannon.update();
  cannon.display();
  }
