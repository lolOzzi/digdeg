import latex.*;
Player p;
Weapons equipped;
Weapons excalibur;
Enemy ene;
Enemy jeff;
Enemy bob;
Enemy mor;
ArrayList<Enemy> enemies;
SceneManager sM;
StageGenerator sG;



public void settings() {
  fullScreen();
  sG = new StageGenerator();
  sG.generate();
  sM = new SceneManager();
  sM.update();
}





public void draw() {
  background(64);

  ellipse(mouseX, mouseY, 20, 20);
  if (sM.dMode) {
    sG.display(); 
    //rect(0, height-100, width, 100);
    p.update();
    p.display();
    p.keyCheck();
    p.collisionCheck();
   
    //println(width);


  } else if (sM.qSMode) {
    sM.update();
  }
}

void startup() {
  excalibur = new Weapons(100, 1, 1000, 1);
  p = new Player();
  equipped = new Weapons();
  ene = new Enemy();
  jeff = new Enemy(600);
  bob = new Enemy(900);
  mor = new Enemy(300, 2f, 500, new PVector(100f, 100f));
  enemies = new ArrayList<Enemy>();
  equipped = excalibur;
  enemies.add(ene);
  enemies.add(jeff);
  enemies.add(bob);
  enemies.add(mor);
}



void mousePressed() {
  sM.mPressed = true;
}
