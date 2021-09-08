

class CannonBall {
  ParticleSystem ps;
  PVector pos, vel, acc;
  float ballSize = 30;
  boolean particles;


  CannonBall(PVector v, float s, PVector cannonLocation, boolean p) {

    particles = p;
    pos = new PVector(v.x, v.y);
    vel = PVector.mult(pos, s/7.5f);
    pos = PVector.add(pos, cannonLocation);
    acc = new PVector(0, 0.13);
    if (particles) ps = new ParticleSystem(pos);
  }

  void Update() {

    vel = PVector.add(acc, vel);
    pos = PVector.add(pos, vel);
    DrawBall();
    if (particles) particles();
  }


  void DrawBall() {
    pushMatrix();
    fill(220);
    translate(pos.x, pos.y);
    circle(0, 0, ballSize);
    popMatrix();
  }

  void particles() {
    ps.addParticle();
    ps.run(pos);
  }

  PVector GetPos() {
    return pos;
  }

  float GetSize() {
    return ballSize;
  }
}
