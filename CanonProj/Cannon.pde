class Cannon {
  PVector location;
  float theta;
  float x;
  float y;

  Cannon(float t) {
    location = new PVector(30, height-90);
    theta = t;
  }

  void update(int a) {
    if (a == 0) theta += 0;
    else if (a == 1) theta += -0.025;
    else if (a == 2) theta += 0.025;
    
    if(theta <= 1.1*PI) theta = 1.1*PI;
    else if(theta >= 1.5*PI) theta = 1.5*PI;
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

  PVector shoot(){
   pushMatrix();
   translate(location.x, location.y);
   
   x = 200 * cos(theta);
   y = 200 * sin(theta);
   PVector ballPos = new PVector(x, y);
   popMatrix();
   
   return ballPos;
  }

}
