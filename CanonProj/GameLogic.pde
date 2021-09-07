class GameLogic {

boolean hojre=false,venstre=false,space=false,enter=false, ball = false;
int kDrej = 0;
int score = 0, hScore = 0, maxTargets = 3, maxBalls = 1, ballsPS = 10;
PVector tSkyd, tSkydS, cannonLocation = new PVector(30, height-90);
float ballTimer = 0;
CannonBall[] balls = new CannonBall[maxBalls];
  
  Cannon cannon;
  StrengthMeter strengthMeter;

  GameLogic() {
    cannon = new Cannon(1.35*PI, cannonLocation);
    strengthMeter = new StrengthMeter();

  }

  void Update() {
    if((hojre && venstre)||(!hojre && !venstre)){kDrej = 0;}
    else if(hojre){kDrej = 2;}
    else {kDrej = 1;}
    
        for(int i = 0; i<maxBalls;i++){
      if(ball){balls[i].Update();}
    }
    
    cannon.update(kDrej);
    cannon.display();
    
    strengthMeter.Update();
    strengthMeter.Draw();
    
    
    //skyd kanonkuglen og sørg for at den kun kan skydes et hvis antal gange i sekundet
    if(space && millis() > ballTimer+(1000f/ballsPS)) {gShoot(); ballTimer = millis();} 
        
  }
  
  void gShoot(){
    ball = true;
    tSkyd = cannon.shoot();
    tSkydS = new PVector(tSkyd.x,tSkyd.y);
    balls[0] = new CannonBall(tSkyd, 0.5f, cannonLocation);
    
  }


  void CheckCollisions() {
  }

  void HandleInput(int k, boolean b) {
    if(k == 39){hojre = b;}
    if(k == 37){venstre = b;}
    if(k == 32){space = b;}
    if(k == 13){enter = b;}
  }

  void DrawScoreTime(int s, int hs, int t) {
    
    
  }
}
