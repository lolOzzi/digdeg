class BossAttack extends Enemy{
  HashMap<String, Animation> aAnimList = new HashMap<>();

  BossAttack(){
  hp = 10000;
  speed = 0;
  gravity = new PVector(0, 0);
  size = new PVector(240/4, 240/4);
  location = new PVector(boss.location.x, boss.location.y);
  velocity = new PVector(0, 4);
  animSetup();
  }
  
  void checkEdges(){}
  
  
  void display(){
    aAnimList.get("Spin").display(location.x, location.y, size.x, size.y);
  }
    
   void animSetup() {
    aAnimList.put("Spin", new Animation("imgs/bossAttack/sprite_", ".png", 4, 12, false));
  }
  


}
