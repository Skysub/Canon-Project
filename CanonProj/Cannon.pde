class Cannon {
  PVector location;
  float theta;
  float x;
  float y;

    Cannon(float t) {
    location = new PVector(30,height-30);
    theta = t;

  }

  void update() {
  }

  void display() {
     float x = 30 * cos(theta);
     float y = height-30 * sin(theta);
     theta += 0.03;
     
    fill(220);
    ellipse(30, height-30, 200, 200);
    
    //rectMode(CENTER);
    pushMatrix();

    translate(location.x,location.y);
    rotate(theta);
    rect(location.x,location.y,30,130);
    popMatrix();

  }


  }
