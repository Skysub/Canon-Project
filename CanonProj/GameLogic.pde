boolean højre=false,venstre=false,space=false,enter=false;
int kDrej = 0;

class GameLogic {

  Cannon cannon;

  GameLogic() {

    cannon = new Cannon(PI*1.35);
  }


  void Update() {
    if((højre && venstre)||!(højre && venstre)){kDrej = 0;}
    else if(højre){kDrej = 2;}
    else {kDrej = 1;}
    
    
    cannon.update(kDrej);
    cannon.display();
  }


  void CheckCollisions() {
  }


  void HandleInput(int k, boolean b) {
    if(k == RIGHT){højre = b;}
    if(k == LEFT){venstre = b;}
    if(k == 32){space = b;}
    if(k == ENTER){enter = b;}
  }

void keyPressed(){
 HandleInput(keyCode,true);
}

void keyReleased(){
 HandleInput(keyCode,false);
}


  void DrawScoreTime(int s, int hs, int t) {
  }
}
