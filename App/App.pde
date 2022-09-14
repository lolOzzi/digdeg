  Player p;
  Weapons equipped;
  Enemy ene;
  ArrayList<Enemy> fs;
  
  
  public void settings() {
    fullScreen();
    startup();
  }

  public void draw(){
    background(64);
    ellipse(mouseX, mouseY, 20, 20);
    rect(0, height-100, width, 100);
    keyCheck();
    p.update();
    p.display();
    
    for(Enemy f : fs) {
    f.update();
    f.display();
    if ((f.location.x <= p.location.x && p.location.x < (f.location.x + f.size.x)) || (f.location.x <= (p.location.x + p.size.x) && (p.location.x + p.size.x) < (f.location.x + f.size.x))){
      print("Player Died");
      startup();
    }
    
    }
  }
  
  void startup(){
    p = new Player();
    equipped = new Weapons();
    ene = new Enemy();
    fs = new ArrayList<Enemy>();
    fs.add(ene);
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
              equipped.attack(p.location, p.size.x);
              if (equipped.facingLeft == true){
                if ((p.location.x + equipped.range) <= ene.location.x && ene.location.x <= p.location.x || (p.location.x + equipped.range) <= ene.location.x + ene.size.x && ene.location.x + ene.size.x <= p.location.x)
                  {
                    ene.hp -= equipped.damage;
                    if (ene.hp >= 0)
                      fs.remove(0);
                  }
                
              }
              else{
                if ((p.location.x <= ene.location.x + ene.size.x && ene.location.x + ene.size.x <= (p.location.x + equipped.range)) || p.location.x <= ene.location.x && ene.location.x <= (p.location.x + equipped.range))
                  {
                    ene.hp -= equipped.damage;
                    if (ene.hp >= 0)
                      fs.remove(0);
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
