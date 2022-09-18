public class Skeleton extends Enemy {
  HashMap<String, Animation> sAnimList= new HashMap<>();

  Skeleton() {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
    animSetupSl();
  }

  Skeleton(float xCor) {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(xCor, 300f);
    velocity = new PVector(speed, 0);
    animSetupSl();
    turn();
  }
  Skeleton(int hp, float speed, int location, PVector size) {
    this.hp = hp;
    this.speed = speed;
    this.size = new PVector(60*size.x, 36*size.y);
    this.location = new PVector(location, 300f);
    velocity = new PVector(speed, 0);
    animSetupSl();
  }
  
  void turn() {
    velocity.x *= -1;
  }
  void display() {

    if ( velocity.x == 0) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else if (this.facingLeft && velocity.x != 0) {
      sAnimList.get("Walk F").display(location.x, location.y, size.x, size.y);
    } else if (!this.facingLeft && velocity.x == 0) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    }
  }

  void animSetupSl() {

    sAnimList.put("Walk", new Animation("imgs/skeleton/walk/sprite_", ".png", 2, 3, false));
    sAnimList.put("Walk F", new Animation("imgs/skeleton/walk/sprite_", ".png", 2, 3, true));
  }
}
