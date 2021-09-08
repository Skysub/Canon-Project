class Target {
  int radius = 35; //Skal bruges både til at tegne den men også til collision calculations
  PVector pos, vel, acc;

  Target(PVector p) {

    pos = new PVector(p.x, p.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void Update() {

    vel = PVector.add(acc, vel);
    pos = PVector.add(pos, vel);

    DrawTarget();
  }


  boolean TjekCollision(PVector b, float ballSize){
    
    if(pos.dist(b) <= radius+(ballSize/2f)){
      return true;      
    }
    return false;
  }


  void DrawTarget() {
    pushMatrix();
    stroke(255,0,0);
    translate(pos.x, pos.y);
    imageMode(CENTER);
    image(target, 0, 0, radius*2.2, radius*2.2);
    //circle(0, 0, radius*2);
    //stroke(0,0,0);
    popMatrix();
  }
}
