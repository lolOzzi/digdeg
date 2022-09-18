public class Player extends Character {
  HashMap<String, Animation> pAnimList = new HashMap<>();
  int counter;
  int wSize; //Equipeed Weapon Size, eg. size = 10, is a 10 x 10 image
  boolean attacking;
  Player()
  {
    location = new PVector(100, 790);
    velocity = new PVector(0, 0);
    size = new PVector(48, 60);
    speed = 1f;
    img = loadImage("imgs/player/player.png");
    animSetup();
    wSize = h.weaponImages.get(equipped.type).width / 5;
    print(wSize + " "  + equipped.type + " " + h.weaponImages.get(equipped.type).width);
  }


  void collisionCheck() {
    for (Enemy f : enemies) {
      f.update();
      f.display();
      checkCollision(f);
    }
  }

  void display() {

    if (this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle F").display(location.x, location.y, size.x, size.y);
      if (attacking) {
        attackAnim();
      }
    } else if (this.facingLeft && velocity.x != 0) {
      pAnimList.get("Run F").display(location.x, location.y, size.x, size.y);
      if (attacking) {
        attackAnim();
      }
    } else if (!this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle").display(location.x, location.y, size.x, size.y);
      if (attacking) {
        attackAnim();
      }
    } else {
      pAnimList.get("Run").display(location.x, location.y, size.x, size.y);
      if (attacking) {
        attackAnim();
      }
    }
  }
  void attackAnim() {
    counter++;
    if (counter < 10) {
      pushMatrix();
      if (this.facingLeft) {
        translate(location.x + 12, location.y + 44);
        rotate(-(float)((2*Math.pow(counter, 2)*TWO_PI/360)-60*TWO_PI/360));
        image(h.flip(h.weaponImages.get(equipped.type)), -wSize, -wSize, wSize, wSize);
      } else {
        translate((location.x + p.size.x -12), (location.y + 44));
        rotate((float)((2*Math.pow(counter, 2)*TWO_PI/360)-60*TWO_PI/360));
        image(h.weaponImages.get(equipped.type), 0, -wSize, wSize, wSize);
      }
      popMatrix();
    } else {
      counter = 0;
      attacking = false;
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

  void moveLeft() {
    if (velocity.y != 0) {
      applyForce(new PVector(-8 * speed, 0));
    } else {
      applyForce(new PVector(-0.5 * speed, 0));
    }

    //velocity.x = -10 * speed;
  }
  void moveRight() {
    if (velocity.y != 0) {
      applyForce(new PVector(8 * speed, 0));
    } else {
      applyForce(new PVector(0.5 * speed, 0));
    }
    //applyForce(new PVector(8 * speed, 0));
    //velocity.x = 10 * speed;
  }
  void stopLeft() {
    velocity.x = 0;
  }
  void stopRight() {
    velocity.x = 0;
  }
  void moveUp() {
    applyForce(new PVector(0, -18));
  }
  void keyCheck() {
    if (keyPressed == true) {
      if (key == 'a' || key == 'A') {
        moveLeft();
      }
      if (key == 'd' || key == 'D') {
        moveRight();
      }
      if ((key == 'w' || key == 'W') && hitGround == true) {
        moveUp();
      } else if (key == 'w' || key == 'W');
      if (key == ' ') {
            
        equipped.countdown();
        if (equipped.canAttack == true) {
          attacking = true;
          attack(location, size.x);
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
  void attack(PVector pLocation, float playerWidth) {
    if (p.facingLeft == true) {
      if (equipped.type == -1) {
        rect(pLocation.x, pLocation.y, (equipped.range *-1) + playerWidth, 10); // Width = Range, Range mod Left subtraheres med Player størrelse, -16 pga. sværdets loaktion på playerens hånd
      } 
    } else {
      if (equipped.type == -1) {
        rect(pLocation.x, pLocation.y, equipped.range, 10);
      }
    }
    equipped.startCD = millis();
  }
  void checkHit(Enemy f) {

    if (f.location.y + f.size.y  >= (location.y - (equipped.range-20)) && f.location.y <= (location.y - (equipped.range-20) + 2 * equipped.range)){
      if (p.facingLeft == true) {
        if (f.location.x + f.size.x >= location.x + 12 - equipped.range && f.location.x <= location.x+ 12)
        {
          f.hp -= equipped.damage;
          if (f.hp <= 0)
            enemies.remove(f);
        }
      }

      if (p.facingLeft == false) {
        if (f.location.x <= location.x + size.x - 12 + equipped.range && f.location.x + f.size.x >= location.x + size.x -12)
        {
          f.hp -= equipped.damage;
          if (f.hp <= 0)
            enemies.remove(f);
        }
      }
    }
  }
}
