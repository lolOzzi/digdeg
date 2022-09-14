  Player p = new Player();
  Weapons equipped = new Weapons();

  public void settings() {
    fullScreen();
  }

  public void draw(){
    background(64);
    ellipse(mouseX, mouseY, 20, 20);
    rect(0, height-100, width, 100);
    keyCheck();
    p.update();
    p.display();
    
    

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
              }if (key == ' ') equipped.attack();
          }
      else if (keyPressed == false){
              if (key == 'a' || key == 'A'){
                  p.stopLeft();
              } else if (key == 'd' || key == 'D'){
                  p.stopRight();
              }
      }
  }
