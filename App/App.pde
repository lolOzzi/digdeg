import latex.*;

Player p;
Slime ene;
Slime jeff;
Slime bob;
Slime mor;
ArrayList<Enemy> enemies;
SceneManager sM;

StageGenerator sG;
Animation anim;
Helper h = new Helper();
ArrayList<Weapons> ownedWeapons;
Weapons[] swords;
Weapons stone;
Weapons iron;
Weapons fire;
Weapons giant;
Weapons equipped;
Shop store;


public void setup() {

  fullScreen();
  h.loadWeaponImages();
  store = new Shop();
  store.weaponList();
  equipped = giant;
  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);
  sG = new StageGenerator();
  sG.generate();
  sM = new SceneManager();
  frameRate(30);
  sM.update();
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



void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  if (sM.dMode) {
    rect(0, height-100, width, 100);
    sG.display();
    //rect(0, height-100, width, 100);
    p.update();
    p.display();
    p.keyCheck();

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
  p = new Player();
  ene = new Slime();
  jeff = new Slime(600f);
  bob = new Slime(900);
  mor = new Slime(300, 2f, 500, new PVector(5f, 5f));
  enemies = new ArrayList<Enemy>();
  enemies.add(ene);
  enemies.add(jeff);
  enemies.add(bob);
  enemies.add(mor);
}


void mousePressed() {
  sM.mPressed = true;
}
