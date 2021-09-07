class GameLogic {

boolean hojre=false,venstre=false,space=false,enter=false, ball = false;
int kDrej = 0, nextBall = 0;
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
    if(space && millis() > ballTimer+(1000f/ballsPS)) {gShoot(); ballTimer = millis();} 
        

    for(int i = 0; i<maxTargets;i++){
      targets[i].Update();
    }
    
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


  void CheckCollisions() {
    for(int i = 0; i<maxBalls; i++){
      for(int j = 0; j<maxTargets; j++){
        if(targets[j].TjekCollision(balls[i].GetPos(),balls[i].GetSize())){
          score++;
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
    if(k == 13){enter = b;}
  }

  void DrawScoreTime(int s, int hs, int t) {
    
    
  }
}
