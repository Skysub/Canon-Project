class GameLogic {

boolean hojre=false,venstre=false,space=false,enter=false;
int kDrej = 0;
int score = 0, hScore = 0, maxTargets = 3, maxBalls = 2, ballsPS;
PVector tSkyd;
float ballTimer = 0;
CannonBall[] balls = new CannonBall[maxBalls];
  
  Cannon cannon;

  GameLogic() {
    cannon = new Cannon(1.35*PI);

  }

  void Update() {
    if((hojre && venstre)||(!hojre && !venstre)){kDrej = 0;}
    else if(hojre){kDrej = 2;}
    else {kDrej = 1;}
    
    if(space && millis()+(1000f/ballsPS) > ballTimer) {gShoot(); ballTimer = millis();}
    
        
    cannon.update(kDrej);
    cannon.display();
  }
  
  void gShoot(){
    
    tSkyd = cannon.shoot();
    balls[0] = new CannonBall(tSkyd, 0.5f);
    
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
