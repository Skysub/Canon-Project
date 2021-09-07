class StrengthMeter{

float strength, y;
boolean flip;
PVector loc;
  
  StrengthMeter(){
    strength = 0.01;
    flip = false;
    y = 400;
  }
  
  
  void Update(){
    
    loc = new PVector(50, y);

    if(strength >= 1){
      strength = 1;
      flip = true;
    } else if(strength <= 0.01){
      strength = 0.01;
      flip = false;
    }
    
    if(flip == false){
      strength += strength/20;
      y -= strength*10;
    }
    if(flip == true){
      strength -= strength/22.65;
      y += strength*10;
    }
    
    print(strength, flip);


  }

  void Draw(){
    rect(50, 185, 50, 224.5);
    
    fill(0);
    rect(loc.x, loc.y, 50, 10);
  }
}
