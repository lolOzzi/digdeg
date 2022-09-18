  Player p;
  Weapons equipped;
  Weapons excalibur;
  Enemy ene;
  Enemy jeff;
  Enemy bob;
  Enemy mor;
  ArrayList<Enemy> enemies;
  
  
  public void settings() {
    fullScreen();
    startup();
  }

  void checkCollision(Enemy f){
    if ((p.location.y <= f.location.y && f.location.y < (p.location.y + p.size.y)) || (f.location.y <= p.location.y && p.location.y < (f.location.y + f.size.y))){
      if ((f.location.x <= p.location.x && p.location.x < (f.location.x + f.size.x)) || (f.location.x <= (p.location.x + p.size.x) && (p.location.x + p.size.x) < (f.location.x + f.size.x))){
        print("Player Died");
        startup();
      }
    }
  }



  public void draw(){
    background(64);
    ellipse(mouseX, mouseY, 20, 20);
    rect(0, height-100, width, 100);
    keyCheck();
    p.update();
    p.display();
    
    for(Enemy f : enemies) {
    f.update();
    f.display();
    checkCollision(f);
    }
  }
  
  void startup(){
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
  
  
  void keyCheck(){
         if(keyPressed == true){
          if (key == 'a' || key == 'A'){
              p.moveLeft();
              equipped.facingLeft = true;
          } else if (key == 'd' || key == 'D'){
              p.moveRight();
              equipped.facingLeft = false;
          } else if ((key == 'w' || key == 'W') && p.location.y > height-110){
                  p.moveUp();           
              }if (key == ' ') {  
                equipped.countdown();
                if(equipped.canAttack == true){
                equipped.attack(p.location, p.size.x);
                ArrayList<Enemy> tEnemies = new ArrayList<>(enemies);
                for (int i = 0; i < tEnemies.size(); i++){
                  checkHit(tEnemies.get(i));
                  print("i Hit");  
              }
                  
                }
            }
          }
      else if (keyPressed == false){
              if (key == 'a' || key == 'A'){
                  p.stopLeft();
              } else if (key == 'd' || key == 'D'){
                  p.stopRight();
              }
      }
  }

  void checkHit(Enemy f){
      
    if ((p.location.y <= f.location.y && f.location.y < (p.location.y + p.size.y)) || (f.location.y <= p.location.y && p.location.y < (f.location.y + f.size.y))){
        
        if (equipped.facingLeft == true){
          print("I AM PROCESSING, I AM A BITCH");
          if ((p.location.x - equipped.range) <= f.location.x && f.location.x <= p.location.x || (p.location.x - equipped.range) <= f.location.x + f.size.x && f.location.x + f.size.x <= p.location.x)
          {
            print("Faced Left");
            f.hp -= equipped.damage;
              if (f.hp <= 0)
                enemies.remove(f);
          }
                    
        }
        
        if (equipped.facingLeft == false){
          if ((p.location.x <= f.location.x + f.size.x && f.location.x + f.size.x <= (p.location.x + equipped.range)) || p.location.x <= f.location.x && f.location.x <= (p.location.x + equipped.range))
          {
            f.hp -= equipped.damage;
            print("Faced Right");
            if (f.hp <= 0)
              enemies.remove(f);
          }
        
      }
    }
  }
