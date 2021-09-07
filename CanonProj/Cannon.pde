class Cannon {
  PVector location;
  float theta, max = 4.85, min = 3.14;
  float x,y;

  Cannon(float t, PVector location) {
    this.location = new PVector(location.x,location.y);
    theta = t;
  }

  void update(int a) {
    if (a == 0) theta += 0;
    else if (a == 1 && theta > min) theta -= 0.01;
    else if (a == 2 && theta < max) theta += 0.01;
    
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

  PVector shoot(){
   pushMatrix();
   translate(location.x, location.y);
   
   y = 200 * cos(theta);
   x = -200 * sin(theta);
   PVector ballPos = new PVector(x-15, y-15);
   popMatrix();
   
   return ballPos;
  }

}
