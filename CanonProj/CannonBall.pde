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
    fill(220);
    translate(pos.x, pos.y);
    circle(0, 0, ballSize);
    popMatrix();

  }
  
  PVector GetPos(){
   return pos; 
  }
  
  float GetSize(){
    return ballSize;
  }
}
