  Player p = new Player();
  Weapons equipped = new Weapons();
  Enemy ene = new Enemy();
  ArrayList<Enemy> fs = new ArrayList<Enemy>();
  
  public void settings() {
    fullScreen();
    fs.add(ene);
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
    f.display();}
    
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
                if ((p.location.x + equipped.range) <= ene.location.x && ene.location.x <= p.location.x)
                  {
                    ene.hp -= equipped.damage;
                    if (ene.hp >= 0)
                      fs.remove(0);
                  }
                
              }
              else{
                if (p.location.x <= ene.location.x && ene.location.x <= (p.location.x + equipped.range))
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
