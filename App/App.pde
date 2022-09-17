import latex.*;
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
StartMenu sMe;


Animation anim;
Helper h = new Helper();

public void setup() {
  fullScreen();
  sMe = new StartMenu();
  sG = new StageGenerator();
  sG.generate();
  store = new Shop();
  store.weaponList();
  equipped = stone;
  sM = new SceneManager();
  frameRate(30);
  sM.update();
  size(400, 400);
  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);
  
}



void draw() {
  background(64);
  ellipse(mouseX, mouseY, 20, 20);
  sM.update();
    
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
