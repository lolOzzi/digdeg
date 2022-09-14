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
            if(keyPressed == true){
        if (key == 'a' || key == 'A'){
            p.velocity.x = -10;
        } else if (key == 'd' || key == 'D'){
            p.velocity.x = 10;
        } else if ((key == 'w' || key == 'W') && p.location.y > height-110){
                p.applyForce(new PVector(0, -10));            
            }
        }
        else if (keyPressed == false){
            if (key == 'a' || key == 'A'){
                p.velocity.x = 0;
            } else if (key == 'd' || key == 'D'){
                p.velocity.x = 0;
            }
        }
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
        if(location.y < height-110){
            applyForce(gravity);
        }
    }

    public void display(){
        rect(location.x, location.y, 10, 10);
    }
    

    void checkEdges(){
        if (location.y > height-110)
            velocity.y = 0;
    }
}