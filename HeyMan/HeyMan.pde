public class Player{

    PVector location;
    PVector velocity;
    PVector acceleration;
    PVector gravity;
    int twoFrameCheck;

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
        keyPressed();
        velocity.add(acceleration);
        location.add(velocity);
        keyReleased();
        acceleration.mult(0);
        if(location.y < height-110){
            applyForce(gravity);
        }

    }

    public void display(){

        rect(location.x, location.y, 10, 10);
    }

    void keyPressed(){
        if (key == CODED && keyPressed == true){
            if (keyCode == LEFT){
                velocity.x = -10;
                twoFrameCheck = 0;
            } else if (keyCode == RIGHT){
                velocity.x = 10;
                twoFrameCheck = 0;
            } else if (keyCode == UP && location.y > height-110){
                applyForce(new PVector(0, -10));
            }
        }
    }

    void keyReleased() {
        if (key == CODED){
            if (keyCode == LEFT){
                keyPressed = false;
                if (twoFrameCheck == 2)
                velocity.x = 0;
                else twoFrameCheck++;
                //applyForce(new PVector(10,0));
            } else if (keyCode == RIGHT){
                keyPressed = false;
                if (twoFrameCheck == 2)
                velocity.x = 0;
                else twoFrameCheck++;
                //applyForce(new PVector(-10,0));
            }
        }
    }

    void checkEdges(){
        if (location.y > height-110)
            velocity.y = 0;
    }
}
