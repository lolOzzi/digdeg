import g4p_controls.*;


import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

import latex.*;
import java.util.ArrayList;
import processing.sound.*;

Player p;
int playerID = -1;
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
Boss boss;
ArrayList<Enemy> enemies;
SceneManager sM;
StageGenerator sG;
VictoryScreen vsM;
Shop store;
StartMenu sMe;
SignIn sI;
Controls cM;
SoundFile soundtrack;
SoundFile gameOver;
SoundFile slime;
SoundFile jump;
SoundFile correct;
ArrayList<Coin> coinList;

PImage platform;
PImage background;

Helper h = new Helper();
BossStageGenerator bSG;
int level = 1;
String[] lines;
int coins;
PrintWriter coinOutput;
ArrayList<Integer> ownedSwords;
String[] wps;
SQLite db;

public void setup() {

  fullScreen();
  frameRate(30);
  
  weaponImages = h.loadImages("imgs/player/weapons/");
  lines = loadStrings("save.txt");
  ownedWeapons = new ArrayList<>();
  platform = loadImage("imgs/map/platform.png");
  background = loadImage("imgs/map/background.png");
  coinList = new ArrayList<>();
  //coinList.add(new Coin(new PVector(-10,-10), 0));
  sI = new SignIn(this);
  sMe = new StartMenu();
  store = new Shop();
  sM = new SceneManager();
  cM = new Controls();
  sG = new StageGenerator();
  vsM = new VictoryScreen();
  sG.generate();
  store.weaponList();
  equipped = stone;
  ownedWeapons = new ArrayList<>();
  ownedWeapons.add(stone);
  sM.update();
  bSG = new BossStageGenerator();
  coins = Integer.valueOf(lines[0]);
  soundtrack = new SoundFile(this, "sounds/soundtrack.mp3");
  gameOver = new SoundFile(this, "sounds/gameOver.wav");
  slime = new SoundFile(this, "sounds/slimehit.mp3");
  jump = new SoundFile(this, "sounds/jump.wav");
  correct = new SoundFile(this, "sounds/correct.mp3");
  soundtrack.play(1, 0.4);
  equipped = ownedWeapons.get(0);
  db = new SQLite( this, "./data/mvDB.sqlite" );
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
  image(background, 0, 0, displayWidth, displayHeight);
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
  level++;
  coinList.add(new Coin(new PVector(128, 30), 0, new PVector(240/2, 240/2)));
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
