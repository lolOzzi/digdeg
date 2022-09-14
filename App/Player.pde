public class Player extends Character{

    Player()
    {
        location = new PVector(100, 790);
        velocity = new PVector(0, 0);
        size = new PVector(10, 10);
        speed = 1f;
    }

    void moveLeft(){
      p.velocity.x = -10 * speed;
    } void moveRight(){
      p.velocity.x = 10 * speed;
    } void stopLeft(){
      p.velocity.x = 0;
    } void stopRight(){
      p.velocity.x = 0;
    } void moveUp(){
      p.applyForce(new PVector(0, -10)); 
    }
}
