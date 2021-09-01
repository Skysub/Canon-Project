
class GameLogic {

  Cannon cannon;

  GameLogic() {

    cannon = new Cannon(1.35*PI);
  }


  void Update() {



    cannon.update();
    cannon.display();
  }


  void CheckCollisions() {
  }


  void HandleInput() {
  }


  void DrawScoreTime(int s, int hs, int t) {
  }
}
