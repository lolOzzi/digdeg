class BossAttack extends Enemy{


  BossAttack(){
  hp = 10000;
  speed = 0;
  gravity = new PVector(0, 1);
  size = new PVector(30, 30);
  location = new PVector(boss.location.x, boss.location.y);
  velocity = new PVector(0, 0);
  }









}
