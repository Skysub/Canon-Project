class GameLogic {

boolean hojre=false,venstre=false,space=false,enter=false, ball = false, round = false, roundBegin = false;
int kDrej = 0, nextBall = 0, timeLimitMin = 1, roundTimer = 0, rTStart;
int score = 0, hScore = 0, maxTargets = 3, //hvor mange targets der maks bliver spawnet samtidig
    maxBalls = 50, //Hvor mange kugler der kan være på skærmen samtidig
    ballsPS = 2; //Hvor mange kugler kanon kan skyde i sekundet
PVector tSkyd, tSkydS, cannonLocation = new PVector(30, height-90);
float ballTimer = 0;

CannonBall[] balls = new CannonBall[maxBalls];
Target[] targets = new Target[maxTargets];
  
  Cannon cannon;
  StrengthMeter strengthMeter;

//constructer
  GameLogic() {
    cannon = new Cannon(1.35*PI, cannonLocation);

    strengthMeter = new StrengthMeter();

    
    //instantierer alle targets
    for(int i = 0; i < maxTargets; i++){
       targets[i] = new Target(new PVector(random(150,width-50),random(50,height-150)));
    }
    
    //instantierer alle boldene
    for(int i=0; i<maxBalls;i++){
    balls[i] = new CannonBall(new PVector(-50,0), 0.5f, new PVector(-50,0));
    }
  }

  void Update() {
    if(!round && enter) roundBegin = true;
    
    //fortæller kanonen hvilken vej den skal dreje
    if((hojre && venstre)||(!hojre && !venstre)){kDrej = 0;}
    else if(hojre){kDrej = 2;}
    else {kDrej = 1;}
    
    //opdaterer boldene
    for(int i = 0; i<maxBalls;i++){
      if(ball){balls[i].Update();}
    }
    
    cannon.update(kDrej);
    cannon.display();
    
    strengthMeter.Update();
    strengthMeter.Draw();
    
    
    //skyd kanonkuglen og sørg for at den kun kan skydes et hvis antal gange i sekundet
    if(round && space && millis() > ballTimer+(1000f/ballsPS)) {gShoot(); ballTimer = millis();} 
        

    for(int i = 0; i<maxTargets;i++){
      targets[i].Update();
    }
    
    handleTimer();
    DrawScoreTime(score,hScore,roundTimer);
    CheckCollisions();
  }
  
  //Skyder en bold af sted
  void gShoot(){
    ball = true;
    tSkyd = cannon.shoot();
    tSkydS = new PVector(tSkyd.x,tSkyd.y);
    
    balls[nextBall] = new CannonBall(tSkyd, strengthMeter.GetStrength(), cannonLocation);
    nextBall++;
    if(nextBall >= maxBalls) nextBall = 0;
  }

  void handleTimer(){
    if(roundBegin){
      round = true; 
      roundBegin = false;
      rTStart = millis();
      score = 0;
    }
    
    if(round){
    roundTimer = rTStart + (timeLimitMin*60000) - millis();
    }
    
    if(round && rTStart + (timeLimitMin*60000) - millis() <= 0){
      roundTimer = timeLimitMin*60000;
      round = false;
      hScore = score;
    }
  }

  void CheckCollisions() {
    for(int i = 0; i<maxBalls; i++){
      for(int j = 0; j<maxTargets; j++){
        if(targets[j].TjekCollision(balls[i].GetPos(),balls[i].GetSize())){
          score++;
          //if(score > hScore) hScore = score;
          targets[j] = new Target(new PVector(random(150,width-50),random(50,height-150)));
        }
      }
    }
  }

//Sørger for at controlsne fungerer
  void HandleInput(int k, boolean b) {
    if(k == 39){hojre = b;}
    if(k == 37){venstre = b;}
    if(k == 32){space = b;}
    if(k == 10){enter = b;}
    
  }

  void DrawScoreTime(int s, int hs, int t) {
    int min, sec;
    pushMatrix();
    fill(20);
    stroke(0,0,0);
    textSize(45);
    translate(20,40);
    
    min = floor(t/60000f);
    t = t - floor(t/60000f)*60000;
    sec = floor(t/1000f);
    t = t - floor(t/1000f)*1000;
    text("Time: "+min+":"+sec+"."+t,0,0);
    
    translate(0,45);
    text("Score: "+s,0,0);
    translate(0,45);
    text("Highscore: "+hs,0,0);
    popMatrix();
    
  }
}
