public class Character{
  PVector location, velocity, size;
  float speed;
  PVector gravity = new PVector(0, 0.1f);
  PVector acceleration = new PVector(0, 0);
  
    void applyForce(PVector force){
        acceleration.add(force);
    }

    
    void update(){
        checkEdges();
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
        if(location.y < height - 100 - size.y){
            applyForce(gravity);
        }
    }
    
    void checkEdges(){
        if (location.y > height - 100 - size.y)
            velocity.y = 0;
    }
    
    void display (){
      rect(location.x, location.y, size.x, size.y); 
    }
  
  
  
  
  
}