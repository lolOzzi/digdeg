public class Skeleton extends Enemy {
  HashMap<String, Animation> sAnimList= new HashMap<>();
  int hCounter;
  int dCounter; 
  
  Skeleton() {
    hp = 20;
    speed = 0.2f;
    size = new PVector(380/4, 520/4);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
    animSetupSl();
  }

  Skeleton(float xCor) {
    hp = 20;
    speed = 0.2f;
    size = new PVector(380/4, 520/4);
    location = new PVector(xCor, 300f);
    velocity = new PVector(speed, 0);
    animSetupSl();
    turn();
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
        if (this.facingLeft) {
        sAnimList.get("Hit F").display(location.x, location.y, size.x, size.y);
        } else {
         sAnimList.get("Hit").display(location.x, location.y, size.x, size.y);
        }
      } else {
        hit = false;
        hCounter = 0;
      }
    }
    if (dead) {
      dCounter++;
      if ((dCounter < 15)) {
        if (!facingLeft){sAnimList.get("Death").display(location.x , location.y, ( 420 / 4)-(420/4-380/4), ( 520 / 4));}
        else {sAnimList.get("Death F").display(location.x , location.y , ( 420 / 4-(420/4-380/4)), ( 520 / 4));}
      } else {
        dCounter = 0;
        enemies.remove(this);
      }
    }
  }

  void animSetupSl() {

    sAnimList.put("Walk", new Animation("imgs/skeleton/walk/sprite_", ".png", 2, 3, false));
    sAnimList.put("Walk F", new Animation("imgs/skeleton/walk/sprite_", ".png", 2, 3, true));
    sAnimList.put("Hit", new Animation("imgs/skeleton/hit/hit", ".png", 1, 1/3, false)); 
    sAnimList.put("Hit F", new Animation("imgs/skeleton/hit/hit", ".png", 1, 1/3, true));  
    sAnimList.put("Death", new Animation("imgs/skeleton/death/sprite_", ".png", 10, 15, false));
    sAnimList.put("Death F", new Animation("imgs/skeleton/death/sprite_", ".png", 10, 15, true));
  }
}
