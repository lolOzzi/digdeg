public class Enemy extends Character{ //<>//
  
    int hp; 
    boolean hit;
    boolean dead;
    
    Enemy(){
    hp = 10;
    speed = 1f;
    size = new PVector(30, 30);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
    }
    
    Enemy(float xCor){
      hp = 10;
      speed = 0.1f;
      size = new PVector(30, 30);
      location = new PVector(xCor, 300f);
      velocity = new PVector(speed, 0);
    }
    
    Enemy(int hp, float speed, int location, PVector size){
      this.hp = hp;
      this.speed = speed;
      this.size = size;
      this.location = new PVector(location, 300f);
      velocity = new PVector(speed, 0);
    }
    
    
}
