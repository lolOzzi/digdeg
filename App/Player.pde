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

    void collisionCheck(){
      for (Enemy f : enemies) {
        f.update();
        f.display();
        checkCollision(f);
      }
    }
    
    void display() {
    //rect(location.x, location.y, size.x, size.y);

    if (this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle F").display(location.x, location.y, size.x, size.y);
      //image(h.flip(img), location.x, location.y, size.x, size.y);
    } else if (this.facingLeft && velocity.x != 0) {
      pAnimList.get("Run F").display(location.x, location.y, size.x, size.y);
    } else if (!this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle").display(location.x, location.y, size.x, size.y);
    } else {
      pAnimList.get("Run").display(location.x, location.y, size.x, size.y);
    }
  }
  
  void animSetup() {
    pAnimList.put("Run", new Animation("imgs/player/run/sprite_", ".png", 5, 15, false));
    pAnimList.put("Run F", new Animation("imgs/player/run/sprite_", ".png", 5, 15, true));
    pAnimList.put("Idle", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, false));
    pAnimList.put("Idle F", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, true));
  }
    
  void checkCollision(Enemy f) {
    if ((p.location.y <= f.location.y && f.location.y < (p.location.y + p.size.y)) || (f.location.y <= p.location.y && p.location.y < (f.location.y + f.size.y))) {
      if ((f.location.x <= p.location.x && p.location.x < (f.location.x + f.size.x)) || (f.location.x <= (p.location.x + p.size.x) && (p.location.x + p.size.x) < (f.location.x + f.size.x))) {
        print("Player Died");
        sM.qSMode = true;
        sM.dMode = false;
        sM.sceneSetup();
        sM.update();
      }
    }
  }

    void moveLeft(){
      velocity.x = -10 * speed;
    } void moveRight(){
      velocity.x = 10 * speed;
    } void stopLeft(){
      velocity.x = 0;
    } void stopRight(){
      velocity.x = 0;
    } void moveUp(){
      applyForce(new PVector(0, -6)); 
    }
    
    void keyCheck() {
      if (keyPressed == true) {
        if (key == 'a' || key == 'A') {
          moveLeft();
        } if (key == 'd' || key == 'D') {
          moveRight();
        } if ((key == 'w' || key == 'W') && hitGround == true) {
          moveUp();
        } else if (key == 'w' || key == 'W');
        if (key == ' ') {
          equipped.countdown();
          if (equipped.canAttack == true) {
            equipped.attack(location, size.x);
            ArrayList<Enemy> tEnemies = new ArrayList<>(enemies);
            for (int i = 0; i < tEnemies.size(); i++) {
              checkHit(tEnemies.get(i));
              print("i Hit");
            }
          }
        }
      } else if (keyPressed == false) {
        if (key == 'a' || key == 'A') {
          stopLeft();
        } else if (key == 'd' || key == 'D') {
          stopRight();
        }
      }
    }

  void checkHit(Enemy f) {
    if ((location.y <= f.location.y && f.location.y < (location.y + size.y)) || (f.location.y <= location.y && location.y < (f.location.y + f.size.y))) {
  
      if (p.facingLeft == true) {
        print("I AM PROCESSING, I AM A BITCH");
        if ((location.x - equipped.range) <= f.location.x && f.location.x <= location.x || (location.x - equipped.range) <= f.location.x + f.size.x && f.location.x + f.size.x <= location.x)
        {
          print("Faced Left");
          f.hp -= equipped.damage;
          if (f.hp <= 0)
            enemies.remove(f);
        }
      }
  
      if (p.facingLeft == false) {
        if ((location.x <= f.location.x + f.size.x && f.location.x + f.size.x <= (location.x + equipped.range)) || location.x <= f.location.x && f.location.x <= (location.x + equipped.range))
        {
          f.hp -= equipped.damage;
          print("Faced Right");
          if (f.hp <= 0)
            enemies.remove(f);
        }
      }
    }
  }
    

}
