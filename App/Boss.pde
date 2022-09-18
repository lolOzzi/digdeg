class Boss extends Enemy{
  float attCooldown;
  int lastAtt;
  
  Boss(){
  attCooldown = 1.2;
  hp = 300;
  speed = -3;
  velocity = new PVector(speed, 0);
  gravity = new PVector(0, 0);
  size = new PVector(200, 200);
  location = new PVector(displayWidth - size.x, 100);
  }
  
  
  void attack(){
    if(millis() >= attCooldown*1000 + lastAtt)
    {
      enemies.add(new BossAttack());
      lastAtt = millis();
    }
  }
}
