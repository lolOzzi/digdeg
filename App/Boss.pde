class Boss extends Enemy {
  float attCooldown;
  int lastAtt;
  HashMap<String, Animation> bAnimList = new HashMap<>();

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
        attCooldown = random(0.2f, 1.3f);
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
    if (velocity.x < 0) {
      bAnimList.get("Fly F").display(location.x, location.y, size.x, size.y);
    } else if (velocity.x > 0) {
      bAnimList.get("Fly").display(location.x, location.y, size.x, size.y);
    }
  }

  void animSetup() {
    bAnimList.put("Fly", new Animation("imgs/boss/fly/sprite_", ".png", 3, 3, false));
    bAnimList.put("Fly F", new Animation("imgs/boss/fly/sprite_", ".png", 3, 3, true));
    bAnimList.put("Attack", new Animation("imgs/boss/attack/sprite_", ".png", 10, 3, false));
    bAnimList.put("Attack F", new Animation("imgs/boss/attack/sprite_", ".png", 10, 3, true));
  }
}
