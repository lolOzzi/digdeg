public class Slime extends Enemy {
  HashMap<String, Animation> sAnimList= new HashMap<>();

  Slime() {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
    animSetup();
  }

  Slime(float xCor) {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(xCor, 300f);
    velocity = new PVector(speed, 0);
    animSetup();
  }
  Slime(int hp, float speed, int location, PVector size) {
    this.hp = hp;
    this.speed = speed;
    this.size = new PVector(60*size.x, 36*size.y);
    this.location = new PVector(location, 300f);
    velocity = new PVector(speed, 0);
    animSetup();
  }


  void display() {

    if ( velocity.x == 0) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else if (equipped.facingLeft && velocity.x != 0) {
      sAnimList.get("Walk F").display(location.x, location.y, size.x, size.y);
    } else if (!equipped.facingLeft && velocity.x == 0) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    }
  }

  void animSetup() {

    sAnimList.put("Walk", new Animation("imgs/slime/walk/sprite_", ".png", 2, 1, false));
    sAnimList.put("Walk F", new Animation("imgs/slime/walk/sprite_", ".png", 2, 1, true));
  }
}
