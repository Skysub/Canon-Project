class Cannon {
  PVector location;
  float theta, max = 4.85, min = 3.14;
  float x,y;

  Cannon(float t) {
    location = new PVector(30, height-90);
    theta = t;
  }

  void update(int a) {
    if (a == 0) theta += 0;
    else if (a == 1 && theta > min) theta -= 0.025;
    else if (a == 2 && theta < max) theta += 0.025;
    
    if(theta > 4.84) theta = max;
    if (theta < 3.16) theta = min;
  }

  void display() {

    fill(220);

    pushMatrix();

    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, 40, 200);
    popMatrix();

    ellipse(location.x, location.y, 200, 200);
  }

  /*PVector shoot(){
   PVector ballPos = new PVector();
   
   return ballPos;
   }*/
}
