import latex.*;
import java.lang.reflect.Field;
Player p;
Weapons equipped;
Weapons stone;
Weapons giant;
Weapons fire;
Weapons iron;
Weapons[] swords;
ArrayList<Weapons> ownedWeapons;
Slime ene;
Slime jeff;
Slime bob;
Slime mor;
ArrayList<Enemy> enemies;
SceneManager sM;
StageGenerator sG;
Shop store;


Animation anim;
Helper h = new Helper();

public void setup() {
  fullScreen();
  sG = new StageGenerator();
  sG.generate();
  store = new Shop();
  store.weaponList();
  equipped = stone;
  sM = new SceneManager();
  frameRate(30);
  animSetup();
  sM.update();
  size(400, 400);
  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);
}
void animSetup() {
  //anim = new Animation("imgs/rin/rinsjov/frame_", "_delay-0.05s.gif", 238, 20, false);
}


void draw() {
  //  background(64);
  /*
  ellipse(mouseX, mouseY, 20, 20);
  //anim.display(0,0);
  if (sM.dMode) {
    sG.display(); 
    //rect(0, height-100, width, 100);
    p.update();
    p.display();
    p.keyCheck();
    p.collisionCheck();
  } else if (sM.qSMode) {
    sM.update();
  }
  */
  store.update();
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
