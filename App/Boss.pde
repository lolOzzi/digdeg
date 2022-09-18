class Boss extends Enemy {
  float attCooldown;
  int lastAtt;
  HashMap<String, Animation> bAnimList = new HashMap<>();
  int hCounter;
  int dCounter;

  Boss() {
    attCooldown = 1.2;
    hp = 300;
    speed = -10;
    velocity = new PVector(speed, 0);
    gravity = new PVector(0, 0);
    size = new PVector(500/2, 460/2);
    location = new PVector(displayWidth - size.x, 150);
    animSetup();
  }


  void attack() {
    if (hp > 0) {
      if (millis() >= attCooldown*1000 + lastAtt)
      {
        attCooldown = random(0.2f, 1f);
        enemies.add(new BossAttack());
        lastAtt = millis();
      }
    }
  }
  void bossUpdate() {
    attack();
    if (0 >= location.x || location.x >= displayWidth - size.x)
      velocity.x = velocity.x * (-1);
  }



  void display() {
    if (velocity.x < 0 && !dead && !hit) {
      bAnimList.get("Fly F").display(location.x, location.y, size.x, size.y);
    } else if (velocity.x > 0 && !dead  && !hit) {
      bAnimList.get("Fly").display(location.x, location.y, size.x, size.y);
    }
    if (hit && !dead) {
      hCounter++;
      if ((hCounter < 3)) {
        if (this.facingLeft) {
          bAnimList.get("Hit F").display(location.x, location.y, size.x, size.y);
        } else {
          bAnimList.get("Hit").display(location.x, location.y, size.x, size.y);
        }
      } else {
        hit = false;
        hCounter = 0;
      }
    }
    if (dead) {
      dCounter++;
      if ((dCounter < 20)) {
        if (!facingLeft) {
          bAnimList.get("Death").display(location.x -((520/2) - size.x), location.y - ((520/2) - size.y), 520 / 2, 520 /2 );
        } else {
          bAnimList.get("Death F").display(location.x  +((520/2) - size.x), location.y - ((520/2) - size.y), 520 / 2, 520 / 2 );
        }
      } else {
        dCounter = 0;
        coinList.add(new Coin(this.location, 1));
        enemies.remove(this);
        sM.scene = 'V';
      }
    }
  }

  void animSetup() {
    bAnimList.put("Fly", new Animation("imgs/boss/fly/sprite_", ".png", 3, 3, false));
    bAnimList.put("Fly F", new Animation("imgs/boss/fly/sprite_", ".png", 3, 3, true));
    bAnimList.put("Attack", new Animation("imgs/boss/attack/sprite_", ".png", 10, 3, false));
    bAnimList.put("Attack F", new Animation("imgs/boss/attack/sprite_", ".png", 10, 3, true));
    bAnimList.put("Hit", new Animation("imgs/boss/hit/sprite_", ".png", 1, 1, true));
    bAnimList.put("Hit F", new Animation("imgs/boss/hit/sprite_", ".png", 1, 1, false));
    bAnimList.put("Death", new Animation("imgs/boss/death/sprite_", ".png", 10, 15, false));
    bAnimList.put("Death F", new Animation("imgs/boss/death/sprite_", ".png", 10, 15, true));
  }
}
