  Player p = new Player();
  Weapons equipped = new Weapons();
  Enemy f = new Enemy();

  public void settings() {
    fullScreen();
  }

  public void draw(){
    background(64);
    ellipse(mouseX, mouseY, 20, 20);
    rect(0, height-100, width, 100);
    keyCheck();
    p.update();
    f.update();
    p.display();
    f.display();
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
              }if (key == ' ') equipped.attack(p.location);
          }
      else if (keyPressed == false){
              if (key == 'a' || key == 'A'){
                  p.stopLeft();
              } else if (key == 'd' || key == 'D'){
                  p.stopRight();
              }
      }
  }
