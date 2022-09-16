public class Player extends Character {
  HashMap<String, Animation> pAnimList = new HashMap<>();
  Player()
  {
    location = new PVector(100, 790);
    velocity = new PVector(0, 0);
    size = new PVector(48, 60);
    speed = 1f;
    img = loadImage("imgs/player/player.png");
    animSetup();
  }

  void moveLeft() {
    p.velocity.x = -10 * speed;
  }
  void moveRight() {
    p.velocity.x = 10 * speed;
  }
  void stopLeft() {
    p.velocity.x = 0;
  }
  void stopRight() {
    p.velocity.x = 0;
  }
  void moveUp() {
    p.applyForce(new PVector(0, -10));
  }
  void animSetup() {
    pAnimList.put("Run", new Animation("imgs/player/run/sprite_", ".png", 5, 15, false));
    pAnimList.put("Run F", new Animation("imgs/player/run/sprite_", ".png", 5, 15, true));
    pAnimList.put("Idle", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, false));
    pAnimList.put("Idle F", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, true));
  }
  void display() {
    //rect(location.x, location.y, size.x, size.y);

    if (equipped.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle F").display(location.x, location.y, size.x, size.y);
      //image(h.flip(img), location.x, location.y, size.x, size.y);
    } else if (equipped.facingLeft && velocity.x != 0) {
      pAnimList.get("Run F").display(location.x, location.y, size.x, size.y);
    } else if (!equipped.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle").display(location.x, location.y, size.x, size.y);
    } else {
      pAnimList.get("Run").display(location.x, location.y, size.x, size.y);
    }
  }
}
