class StrengthMeter {

  float strength, y;
  boolean flip;
  PVector loc;
  color c1, c2;

  StrengthMeter() {
    strength = 0.01;
    flip = false;
    y = 400;
    c1 = color(200, 0, 0);
    c2 = color(20, 200, 20);
  }


  void Update() {

    loc = new PVector(50, y);

    if (strength >= 1) {
      strength = 1;
      flip = true;
    } else if (strength <= 0.01) {
      strength = 0.01;
      flip = false;
    }

    if (flip == false) {
      strength += strength/20;
      y -= strength*10;
    }
    if (flip == true) {
      strength -= strength/22.65;
      y += strength*10;
    }
  }


  float GetStrength() {
    return strength;
  }

  void Draw() {
    setGradient(50, 185, 50, 224.5, c1, c2);

    fill(0);
    stroke(0);
    rect(loc.x, loc.y, 50, 10);
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2) {

    noFill();
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
