public class Enemy extends Player{
     int hp; 
     float speed; //Movement Speed
     PVector size, location;
 
     public void display(){
        rect(location.x, location.y, size.x, size.y);
    }
    
    Enemy(){
    hp = 10;
    speed = 0.1f;
    size = new PVector(30, 30);
    location = new PVector(300f, 300f);
    }
    
    void update(){
      location.x += speed;
    }
  
  
  
  
}
