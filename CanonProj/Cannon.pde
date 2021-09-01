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
    
   if (keyPressed == true) {
    if (keyCode == UP) {
      theta += -0.05;
    }
    if (keyCode == DOWN) {
      theta += 0.05;
      }
    }
   }

  void display() {
     //theta += 0.03;
     
    fill(220);
    
    pushMatrix();

    translate(location.x,location.y);
    rotate(theta);
    rect(0,0,40,200);
    popMatrix();
    
    ellipse(30, height-30, 200, 200);

  }


  }
