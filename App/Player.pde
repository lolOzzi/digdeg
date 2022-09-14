public class Player{

    PVector location, velocity, acceleration, gravity;
    boolean left = false, right = false;



    Player()
    {
        location = new PVector(100, 790);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        gravity = new PVector(0.0f, 0.1f);
    }

    void applyForce(PVector force){
        acceleration.add(force);
    }

    void update(){
        checkEdges();
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
        if(location.y < height-110){
            applyForce(gravity);
        }
    }
    
    void moveLeft(){
      p.velocity.x = -10;
    } void moveRight(){
      p.velocity.x = 10;
    } void stopLeft(){
      p.velocity.x = 0;
    } void stopRight(){
      p.velocity.x = 0;
    } void moveUp(){
      p.applyForce(new PVector(0, -10)); 
    }

    public void display(){
        rect(location.x, location.y, 10, 10);
    }
    

    void checkEdges(){
        if (location.y > height-110)
            velocity.y = 0;
    }

}
