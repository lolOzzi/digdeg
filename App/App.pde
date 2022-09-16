import latex.*;
Player p;
Weapons equipped;
Weapons excalibur;
Slime ene;
Slime jeff;
Slime bob;
Slime mor;
ArrayList<Enemy> enemies;
SceneManager sM;

HashMap<String, Animation> pAnimList = new HashMap<>();
HashMap<String, Animation> sAnimList = new HashMap<>();
Animation anim;
Helper h = new Helper();

public void setup() {

  fullScreen();
  sM = new SceneManager();
  frameRate(30);
  animSetup();
  sM.update();
  size(400, 400);
}
void animSetup() {
  anim = new Animation("imgs/rin/rinsjov/frame_", "_delay-0.05s.gif", 238, 20, false);
  pAnimList.put("Run", new Animation("imgs/player/run/sprite_", ".png", 5, 15, false));
  pAnimList.put("Run F", new Animation("imgs/player/run/sprite_", ".png", 5, 15, true));
  pAnimList.put("Idle", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, false));
  pAnimList.put("Idle F", new Animation("imgs/player/idle/sprite_", ".png", 2, 3, true));

  sAnimList.put("Walk", new Animation("imgs/slime/walk/sprite_", ".png", 2, 0.5, false));
  sAnimList.put("Walk F", new Animation("imgs/slime/walk/sprite_", ".png", 2, 0.5, true));
  
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



public void draw() {
  background(64);
  ellipse(mouseX, mouseY, 20, 20);
  //anim.display(0,0);
  if (sM.dMode) {
    rect(0, height-100, width, 100);
    keyCheck();
    p.update();
    p.display();

    for (Enemy f : enemies) {
      f.update();
      f.display();
      checkCollision(f);
    }
  } else if (sM.qSMode) {
    sM.update();
  }
}

void startup() {
  excalibur = new Weapons(100, 1, 1000, 1);
  p = new Player();
  equipped = new Weapons();
  ene = new Slime();
  jeff = new Slime(600f);
  bob = new Slime(900);
  mor = new Slime(300, 2f, 500, new PVector(5f, 5f));
  enemies = new ArrayList<Enemy>();
  equipped = excalibur;
  enemies.add(ene);
  enemies.add(jeff);
  enemies.add(bob);
  enemies.add(mor);
}


void keyCheck() {
  if (keyPressed == true) {
    if (key == 'a' || key == 'A') {
      p.moveLeft();
      equipped.facingLeft = true;
    } else if (key == 'd' || key == 'D') {
      p.moveRight();
      equipped.facingLeft = false;
    } else if ((key == 'w' || key == 'W') && p.location.y > height-(100 + p.size.y)) {
      p.moveUp();
    }
    if (key == ' ') {
      equipped.countdown();
      if (equipped.canAttack == true) {
        equipped.attack(p.location, p.size.x);
        ArrayList<Enemy> tEnemies = new ArrayList<>(enemies);
        for (int i = 0; i < tEnemies.size(); i++) {
          checkHit(tEnemies.get(i));
        }
      }
    }
  } else if (keyPressed == false) {
    if (key == 'a' || key == 'A') {
      p.stopLeft();
    } else if (key == 'd' || key == 'D') {
      p.stopRight();
    }
  }
}

void checkHit(Enemy f) {

  if ((p.location.y <= f.location.y && f.location.y < (p.location.y + p.size.y)) || (f.location.y <= p.location.y && p.location.y < (f.location.y + f.size.y))) {

    if (equipped.facingLeft == true) {
      if ((p.location.x - equipped.range) <= f.location.x && f.location.x <= p.location.x || (p.location.x - equipped.range) <= f.location.x + f.size.x && f.location.x + f.size.x <= p.location.x)
      {
        f.hp -= equipped.damage;
        if (f.hp <= 0)
          enemies.remove(f);
      }
    }

    if (equipped.facingLeft == false) {
      if ((p.location.x <= f.location.x + f.size.x && f.location.x + f.size.x <= (p.location.x + equipped.range)) || p.location.x <= f.location.x && f.location.x <= (p.location.x + equipped.range))
      {
        f.hp -= equipped.damage;
        if (f.hp <= 0)
          enemies.remove(f);
      }
    }
  }
}
void mousePressed() {
  sM.mPressed = true;
}
