boolean hojre=false,venstre=false,space=false,enter=false;
int kDrej = 0;

class GameLogic {

  Cannon cannon;

  GameLogic() {
    cannon = new Cannon(1.35*PI);

  }

  void Update() {
    if((hojre && venstre)||(!hojre && !venstre)){kDrej = 0;}
    else if(hojre){kDrej = 2;}
    else {kDrej = 1;}
        
    cannon.update(kDrej);
    cannon.display();
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
