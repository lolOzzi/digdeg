public class Character {
  PVector location, velocity, size;
  float speed;
  PVector gravity = new PVector(0, 0.5f);
  PVector acceleration = new PVector(0, 0);
  PImage img;
  boolean facingLeft;


  void applyForce(PVector force) {
    acceleration.add(force);
  }


  void update() {
    checkEdges();
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    if (location.y < height - 100 - size.y) {
      applyForce(gravity);
    }
    checkDirection();
  }

  void checkEdges() {
    if (location.y > height - 100 - size.y)
      velocity.y = 0;
  }

  void display () {
    rect(location.x, location.y, size.x, size.y);
  }
  void checkDirection() {
    if (velocity.x < 0) {
      facingLeft = true;
    } else if (velocity.x > 0) {
      facingLeft = false;
    }
  }
}
