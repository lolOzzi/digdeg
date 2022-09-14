public class Enemy extends Character{
  
    int hp; 
    
    Enemy(){
    hp = 10;
    speed = 0.1f;
    size = new PVector(30, 30);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
    }
    
}
