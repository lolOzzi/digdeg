public class Slime extends Enemy {
  HashMap<String, Animation> sAnimList= new HashMap<>();
  int hCounter;
  int dCounter;

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
    turn();
  }
  Slime(int hp, float speed, int location, PVector size) {
    this.hp = hp;
    this.speed = speed;
    this.size = new PVector(60*size.x, 36*size.y);
    this.location = new PVector(location, 300f);
    velocity = new PVector(speed, 0);
    animSetup();
  }

  void turn() {
    velocity.x *= -1;
  }


  void display() {

    if ( velocity.x == 0 && !hit && !dead) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else if (this.facingLeft && velocity.x != 0 && !hit&& !dead ) {
      sAnimList.get("Walk F").display(location.x, location.y, size.x, size.y);
    } else if (!this.facingLeft && velocity.x == 0&& !hit&& !dead) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else if (!this.facingLeft && velocity.x != 0 && !hit&& !dead) {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    }
    if (hit && !dead) {
      hCounter++;
      if ((hCounter < 3)) {
        sAnimList.get("Hit").display(location.x, location.y, size.x, size.y);
      } else {
        hit = false;
        hCounter = 0;
      }
    }
    if (dead) {
      dCounter++;
      if ((dCounter < 15)) {
        if (!facingLeft){sAnimList.get("Death").display(location.x - (8*size.x/60), location.y - (20*size.y/36), ( 320 / 5) * size.x / 60, ( 280 / 5) * size.y / 36);}
        else {sAnimList.get("Death F").display(location.x + (8*size.x/60), location.y - (20*size.y/36), ( 320 / 5) * size.x / 60, ( 280 / 5) * size.y / 36 );}
      } else {
        dCounter = 0;
        enemies.remove(this);
      }
    }
  }


  void animSetup() {
    sAnimList.put("Walk", new Animation("imgs/slime/walk/sprite_", ".png", 2, 3, false));
    sAnimList.put("Walk F", new Animation("imgs/slime/walk/sprite_", ".png", 2, 3, true));
    sAnimList.put("Hit", new Animation("imgs/slime/hit/hit", ".png", 1, 1/3, false));
    sAnimList.put("Death", new Animation("imgs/slime/death/sprite_", ".png", 6, 10, false));
    sAnimList.put("Death F", new Animation("imgs/slime/death/sprite_", ".png", 6, 10, true));
  }
}
