public class Player extends Character {
  HashMap<String, Animation> pAnimList = new HashMap<>();
  int counter;
  int wSize; //Equipeed Weapon Size, eg. size = 10, is a 10 x 10 image
  boolean attacking;
  PImage img;
  ArrayList<Enemy> tEnemies;

  Player()
  {
    location = new PVector(100, 790);
    velocity = new PVector(0, 0);
    size = new PVector(48, 60);
    speed = 1f;
    img = loadImage("imgs/player/player.png");
    animSetup();
    wSize = weaponImages.get(equipped.type).width / 5;
  }
  void collisionCheck() {
    tEnemies = new ArrayList<>(enemies);
    for (int i = 0; i < tEnemies.size(); i++) {
      tEnemies.get(i).update();
      tEnemies.get(i).display();
      checkCollision(tEnemies.get(i));
    }
  }

  void display() {
    println(this.hitGround);
    if (this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle F").display(location.x, location.y, size.x, size.y);
    } else if (this.facingLeft && velocity.x != 0) {
      pAnimList.get("Run F").display(location.x, location.y, size.x, size.y);
    } else if (!this.facingLeft && velocity.x == 0) {
      pAnimList.get("Idle").display(location.x, location.y, size.x, size.y);
    } else {
      pAnimList.get("Run").display(location.x, location.y, size.x, size.y);
    }
    if (attacking) {
      attackAnim();
      tEnemies = new ArrayList<>(enemies);
      for (int i = 0; i < tEnemies.size(); i++) {
        checkHit(tEnemies.get(i));
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
        image(h.flip(weaponImages.get(equipped.type)), -wSize, -wSize, wSize, wSize);
      } else {
        translate((location.x + p.size.x -12), (location.y + 44));
        rotate((float)((2*Math.pow(counter, 2)*TWO_PI/360)-60*TWO_PI/360));
        image(weaponImages.get(equipped.type), 0, -wSize, wSize, wSize);
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
    if ((f.location.y + f.size.y > location.y && f.location.y < location.y + size.y) && !f.dead) {
      if (f.location.x < location.x + size.x && f.location.x + f.size.x > location.x) {
        print("Player Died");
        sM.scene = 'Q';
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

    if (f.location.y + f.size.y  >= (location.y - (equipped.range-20)) && f.location.y <= (location.y - (equipped.range-20) + 2 * equipped.range)) {
      if (p.facingLeft == true) {
        if (f.location.x + f.size.x >= location.x + 12 - equipped.range && f.location.x <= location.x+ 12)
        {
          if (counter == 1) {
            f.hp -= equipped.damage;
            f.hit = true;
            if (f.hp <= 0)
              f.dead = true;
          }
        }
      }

      if (p.facingLeft == false) {
        if (f.location.x <= location.x + size.x - 12 + equipped.range && f.location.x + f.size.x >= location.x + size.x -12)
        {
          if (counter == 1) {
            f.hp -= equipped.damage;
            f.hit = true;
            if (f.hp <= 0)
              f.dead = true;
          }
        }
      }
    }
  }
}
