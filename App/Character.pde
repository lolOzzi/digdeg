public class Character {
  PVector location, velocity, size;
  float speed;
  PVector gravity = new PVector(0, 0.5f);
  PVector acceleration = new PVector(0, 0);
  boolean hitGround;
  boolean facingLeft;

  void checkDirection() {
    if (velocity.x < 0) {
      facingLeft = true;
    } else if (velocity.x > 0) {
      facingLeft = false;
    }
  }
  
    void applyForce(PVector force){
        acceleration.add(force);
    }

    
    void update(){
        checkEdges();
        velocity.add(acceleration);
        if (velocity.x > 10) {
          velocity.x = 10;
        } else if (velocity.x < -10 ) {
          velocity.x = -10;
        }
        if (velocity.y < -18 ) {
          velocity.y = -18;
        }

        location.add(velocity);
        acceleration.mult(0);
        if(hitGround == false){
            applyForce(gravity);
        }
        checkDirection();
    }
    
    
    void display (){
      rect(location.x, location.y, size.x, size.y); 
    }
    
    Character() {
      location = new PVector(displayWidth + 1, displayHeight + 1);
      velocity = new PVector(0, 0);
      size = new PVector(0, 0);
      speed = 0f;
    }
  
  
  
  void checkEdges(){
    for (int i = 0; i < sG.locations.size(); i++){
      if (location.x <= sG.locations.get(i).x + sG.sizes.get(i).x && sG.locations.get(i).x <= location.x + size.x)

        if (sG.locations.get(i).y < location.y + size.y && location.y < sG.locations.get(i).y + sG.sizes.get(i).y){
            velocity.y = 0;
            location.y = sG.locations.get(i).y - size.y;
            hitGround = true;
            ellipse(sG.locations.get(i).x, sG.locations.get(i).y, 10, 10);
        }
      else hitGround = false;
      
    }
  }
}
