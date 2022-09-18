import latex.*;
import java.util.ArrayList;
import processing.sound.*;

Player p;
Weapons stone;
Weapons iron;
Weapons fire;
Weapons giant;
Weapons equipped;
Weapons[] swords;
ArrayList<Weapons> ownedWeapons;
ArrayList<PImage> weaponImages;

Slime jeffSl;
Slime morSl;
Skeleton eneSk;
Skeleton bobSk;
ArrayList<Enemy> enemies;

SceneManager sM;
StageGenerator sG;
VictoryScreen vsM;
Shop store;
StartMenu sMe;
Controls cM;

SoundFile soundtrack;
SoundFile gameOver;
SoundFile slime;
SoundFile jump;
SoundFile correct;

Helper h = new Helper();


public void setup() {

  fullScreen();
  frameRate(30);

  weaponImages = h.loadImages("imgs/player/weapons/");

  sMe = new StartMenu();
  store = new Shop();
  sM = new SceneManager();
  cM = new Controls();
  sG = new StageGenerator();
  vsM = new VictoryScreen();
  sG.generate();

  store.weaponList();
  equipped = giant;
  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);

  sM.update();

  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);

  //Sound Effects
  soundtrack = new SoundFile(this, "sounds/soundtrack.mp3");
  gameOver = new SoundFile(this, "sounds/gameOver.wav");
  slime = new SoundFile(this, "sounds/slimehit.mp3");
  jump = new SoundFile(this, "sounds/jump.wav");
  correct = new SoundFile(this, "sounds/correct.mp3");
  soundtrack.play(1, 0.4);
}
void checkCollision(Enemy f) {
  if ((p.location.y <= f.location.y && f.location.y < (p.location.y + p.size.y)) || (f.location.y <= p.location.y && p.location.y < (f.location.y + f.size.y))) {
    if ((f.location.x <= p.location.x && p.location.x < (f.location.x + f.size.x)) || (f.location.x <= (p.location.x + p.size.x) && (p.location.x + p.size.x) < (f.location.x + f.size.x))) {
      print("Player Died");
      sM.scene = 'Q';
      sM.sceneSetup();
      sM.update();
    }
  }
}



void draw() {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  sM.update();

}

void startup() {
  p = new Player();
  eneSk = new Skeleton();
  jeffSl = new Slime(600f);
  bobSk = new Skeleton(900);
  morSl = new Slime(300, 2f, 500, new PVector(5f, 5f));
  enemies = new ArrayList<Enemy>();
  enemies.add(eneSk);
  enemies.add(jeffSl);
  enemies.add(bobSk);
  enemies.add(morSl);
}

void mousePressed() {
  sM.mPressed = true;
} 
void keyPressed() {
  if (keyCode == ESC) {
    key = 0;
    sM.scene = 'M';
  }
}
