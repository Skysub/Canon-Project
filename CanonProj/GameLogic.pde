
class GameLogic {

  Cannon cannon;

  GameLogic() {

    cannon = new Cannon(0.05f);
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
