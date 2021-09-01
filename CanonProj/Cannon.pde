class Cannon {
  PVector location;
  float theta;
  float x;
  float y;

    Cannon(float t, int a) {
    location = new PVector(30,height-90);
    theta = t;
    rotationDecider = a;

  }

  void update() {
   
   /*if (keyPressed == true) {
    if (keyCode == UP && theta >= 1.1*PI) {
      theta += -0.025;
    }
    if (keyCode == DOWN && theta <= 1.5*PI) {
      theta += 0.025;
      }
    } */ //Gamle controls
    
    if(rotationDecider == 0) theta = 0;
    if(rotationDecider == 1) theta += -0.025;
    if(rotationDecider == 2) theta += 0.025;
    
   }

  void display() {
     
    fill(220);
    
    pushMatrix();

    translate(location.x,location.y);
    rotate(theta);
    rect(0,0,40,200);
    popMatrix();
    
    ellipse(location.x, location.y, 200, 200);

  }
  
  /*PVector shoot(){
    PVector ballPos = new PVector();
    
    return ballPos;
  }*/
  
  
  
  }


  }
