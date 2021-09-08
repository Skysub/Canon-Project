class Target {
  int radius = 35; //Skal bruges både til at tegne den men også til collision calculations
  PVector pos, vel, acc;
  boolean hardMode = false;
  int tStart, life = 5000;

  Target(PVector p, boolean hard) {

    
    hardMode = hard;
    if (hardMode) life = int(random(3000,5000)); 
    pos = new PVector(p.x, p.y);
    vel = new PVector(0, 0);
    if (hardMode) {
      acc = PVector.random2D().normalize().mult(0.001f);
    }
    else
    {
     acc = new PVector(0,0); 
    }
    tStart = millis();
  }

  boolean Update() {

    if (millis() > tStart + life && hardMode) return true;
    vel = PVector.add(acc, vel);
    pos = PVector.add(pos, vel);

    DrawTarget();
    return false;
  }


  boolean TjekCollision(PVector b, float ballSize) {

    if (pos.dist(b) <= radius+(ballSize/2f)) {
      return true;
    }
    return false;
  }


  void DrawTarget() {
    pushMatrix();
    fill(255);
    stroke(255, 0, 0);
    strokeWeight(4);
    translate(pos.x, pos.y);

    imageMode(CENTER);
    image(target, 0, 0, radius*2.2, radius*2.2);
    //circle(0, 0, radius*2);
    //stroke(0,0,0);

    /*circle(0, 0, radius*2); frederik targets
     circle(0, 0, radius*1.25f);
     circle(0, 0, radius/2f);
     strokeWeight(2);
     stroke(0,0,0);*/

    popMatrix();
  }
}
