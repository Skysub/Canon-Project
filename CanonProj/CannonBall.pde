class CannonBall {
  PVector pos, vel, acc;
  float ballSize = 30;


  CannonBall(PVector v, float s, PVector cannonLocation) {

    pos = new PVector(v.x, v.y);
    vel = PVector.mult(pos, s/7.5f);
    pos = PVector.add(pos, cannonLocation);
    acc = new PVector(0, 0.13);
  }

  void Update() {

    vel = PVector.add(acc, vel);
    pos = PVector.add(pos, vel);
    DrawBall();
  }


  void DrawBall() {
    pushMatrix();
    translate(pos.x, pos.y);
    circle(ballSize/2f, ballSize/2f, ballSize);
    popMatrix();

  }
  
  PVector GetPos(){
   return pos; 
  }
  
  float GetSize(){
    return ballSize;
  }
}
