class GameLogic {

boolean hojre=false,venstre=false,space=false,enter=false, ball = false;
int kDrej = 0, nextBall = 0;
int score = 0, hScore = 0, maxTargets = 3, //hvor mange targets der maks bliver spawnet samtidig
    maxBalls = 50, //Hvor mange kugler der kan være på skærmen samtidig
    ballsPS = 10; //Hvor mange kugler kanon kan skyde i sekundet
PVector tSkyd, tSkydS, cannonLocation = new PVector(30, height-90);
float ballTimer = 0;

CannonBall[] balls = new CannonBall[maxBalls];
  
  Cannon cannon;

//constructer
  GameLogic() {
    cannon = new Cannon(1.35*PI, cannonLocation);
    
    //instantierer alle boldene
    for(int i=0; i<maxBalls;i++){
    balls[i] = new CannonBall(new PVector(-50,0), 0.5f, new PVector(-50,0));
    }
  }

  void Update() {
    //fortæller kanonen hvilken vej den skal ddreje
    if((hojre && venstre)||(!hojre && !venstre)){kDrej = 0;}
    else if(hojre){kDrej = 2;}
    else {kDrej = 1;}
    
    //opdaterer boldene
        for(int i = 0; i<maxBalls;i++){
      if(ball){balls[i].Update();}
    }
    
    cannon.update(kDrej);
    cannon.display();
    
    //skyd kanonkuglen og sørg for at den kun kan skydes et hvis antal gange i sekundet
    if(space && millis() > ballTimer+(1000f/ballsPS)) {gShoot(); ballTimer = millis();} 
        

  }
  
  //Skyder en bold af sted
  void gShoot(){
    ball = true;
    tSkyd = cannon.shoot();
    tSkydS = new PVector(tSkyd.x,tSkyd.y);
    
    balls[nextBall] = new CannonBall(tSkyd, 0.5f, cannonLocation);
    nextBall++;
    if(nextBall >= maxBalls) nextBall = 0;
  }


  void CheckCollisions() {
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
