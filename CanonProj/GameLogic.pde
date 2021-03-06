class GameLogic {


  boolean hojre=false, venstre=false, space=false, enter=false, enterF = false, ball = false, round = false, roundBegin = false, hard = false, op = false, ned = false, lastModeHard = false, p = true, pp = false, ppp = false, particles = false;;
  int kDrej = 0, nextBall = 0, timeLimitMin = 1, roundTimer = 60000, rTStart;
  int score = 0, hScore = 0, hHScore = 0, maxTargets = 3, //hvor mange targets der maks bliver spawnet samtidig
    maxBalls = 10, //Hvor mange kugler der kan være på skærmen samtidig

    ballsPS = 2; //Hvor mange kugler kanon kan skyde i sekundet
  PVector tSkyd, tSkydS, cannonLocation = new PVector(30, height-90);
  float ballTimer = 0;
  SoundFile fire, hit;

  CannonBall[] balls = new CannonBall[maxBalls];
  Target[] targets = new Target[maxTargets];

  Cannon cannon;
  StrengthMeter strengthMeter;

  //constructer
  GameLogic() {
    cannon = new Cannon(1.35*PI, cannonLocation);

    strengthMeter = new StrengthMeter();
    fire = new SoundFile(CanonProj.this, "Cannonfire.mp3");
    hit = new SoundFile(CanonProj.this, "Hit.mp3");


    //instantierer alle targets
    for (int i = 0; i < maxTargets; i++) {
      targets[i] = new Target(new PVector(random(150, width-150), random(50, height-150)), hard);
    }

    //instantierer alle boldene
    for (int i=0; i<maxBalls; i++) {
      balls[i] = new CannonBall(new PVector(-50, 0), 0.5f, new PVector(-50, 0), p);
    }
  }

  void Update() {

    if (!p && pp && !ppp) {
      p = true; 
      ppp = true;
    }
    if (p && pp && !ppp) {
      p = false; 
      ppp = true;
    }
    if(ppp && !pp) ppp = false;
    if (p) particles = false;
    
    if (enter && !round && !enterF) {
      roundBegin = true;       
      enterF = true;
    }
    if (enter && round && !enterF) {
      enterF = true;
      round = false; 
      roundBegin = false;
      if (hHScore < score && lastModeHard) hHScore = score;
      if (hScore < score) hScore = score;
    }

    if (op && !round) hard = true;
    if (ned && !round) hard = false;
    DrawMidtTekst();


    //fortæller kanonen hvilken vej den skal dreje
    if ((hojre && venstre)||(!hojre && !venstre)) {
      kDrej = 0;
    } else if (hojre) {
      kDrej = 2;
    } else {
      kDrej = 1;
    }

    //opdaterer boldene
    for (int i = 0; i<maxBalls; i++) {
      if (ball) {
        balls[i].Update();
      }
      if (particles) {
        balls[i].particles();
      }
    }

    cannon.update(kDrej);
    cannon.display();

    strengthMeter.Update();
    strengthMeter.Draw();


    //skyd kanonkuglen og sørg for at den kun kan skydes et hvis antal gange i sekundet
    if (round && space && millis() > ballTimer+(1000f/ballsPS)) {
      gShoot(); 
      ballTimer = millis();
    } 


    for (int i = 0; i<maxTargets; i++) {
      if (targets[i].Update()) targets[i] = new Target(new PVector(random(150, width-150), random(50, height-150)), lastModeHard);
    }

    handleTimer();
    DrawScoreTime(score, hScore, roundTimer, hHScore);
    CheckCollisions();
  }

  //Skyder en bold af sted
  void gShoot() {
    ball = true;
    tSkyd = cannon.shoot();
    tSkydS = new PVector(tSkyd.x, tSkyd.y);
    fire.amp(strengthMeter.GetStrength());
    fire.play();

    balls[nextBall] = new CannonBall(tSkyd, strengthMeter.GetStrength(), cannonLocation, p);
    nextBall++;
    if (nextBall >= maxBalls) nextBall = 0;
  }

  void handleTimer() {
    if (roundBegin) {
      //instantierer alle targets
      for (int i = 0; i < maxTargets; i++) {
        targets[i] = new Target(new PVector(random(150, width-150), random(50, height-150)), hard);
      }
      round = true; 
      roundBegin = false;
      if (hHScore < score && lastModeHard) hHScore = score;
      lastModeHard = false;
      if (hard) lastModeHard = true;
      rTStart = millis();
      if (hScore < score) hScore = score;

      score = 0;
    }

    if (round) {
      roundTimer = rTStart + (timeLimitMin*60000) - millis();
    }

    if (round && rTStart + (timeLimitMin*60000) - millis() <= 0) {
      roundTimer = timeLimitMin*60000;
      round = false;
      if (hScore < score) hScore = score;
    }
  }

  void CheckCollisions() {
    for (int i = 0; i<maxBalls; i++) {
      for (int j = 0; j<maxTargets; j++) {
        if (targets[j].TjekCollision(balls[i].GetPos(), balls[i].GetSize())) {
          score++;
          hit.amp(0.2);
          hit.play();
          //if(score > hScore) hScore = score;
          targets[j] = new Target(new PVector(random(150, width-150), random(50, height-150)), lastModeHard);
        }
      }
    }
  }

  //Sørger for at controlsne fungerer
  void HandleInput(int k, boolean b) {

    if (k == 39)hojre = b;
    if (k == 37)venstre = b;
    if (k == 32)space = b;
    if (k == 10) {
      if (!b)enterF = false; 
      enter = b;
    }
    if (k == 40) ned = b;
    if (k == 38) op = b;
    if (k == 80) pp = b;

  }

  void DrawScoreTime(int s, int hs, int t, int hhs) {
    int min, sec;
    pushMatrix();
    fill(20);
    stroke(0, 0, 0);
    textSize(45);
    translate(20, 40);

    min = floor(t/60000f);
    t = t - floor(t/60000f)*60000;
    sec = floor(t/1000f);
    t = t - floor(t/1000f)*1000;
    text("Time: "+min+":"+sec+"."+t, 0, 0);

    translate(350, 0);
    fill(255, 40, 40);
    if (lastModeHard) text("Hardmode", 0, 0);
    fill(20);
    translate(-350, 0);

    translate(0, 45);
    text("Score: "+s, 0, 0);
    textSize(25);
    translate(1, 30);
    text("Highscore: "+hs, 0, 0);
    translate(1, 30);
    textSize(20);
    fill(255, 40, 40);
    text("Hardmode ", 0, 0);
    fill(20);
    translate(105, 0);
    text("Highscore: "+hhs, 0, 0);
    popMatrix();
  }

  void DrawMidtTekst() {
    pushMatrix();
    fill(20);
    stroke(0, 0, 0);
    textSize(45);
    translate(width/2-200, height/2);
    if (!round)text("Press enter to begin", 0, 0);
    translate(90, 45);
    fill(255, 40, 40);
    if (hard && !round)text("Hardmode", 0, 0);
    popMatrix();
  }
}
