class SceneManager {
  QScreen qS;
  boolean spacePressed;
  boolean spaceReleased;
  boolean mPressed;
  boolean qSMode;
  boolean gameMode;
  boolean smMode;
  boolean shMode;
  boolean controlMode;

  public SceneManager() {
    gameMode = false;
    smMode = false;
    shMode = false;
    qSMode = false;
    controlMode = false;
    sceneSetup();
  }

  public void update() {
    
    if (controlMode){
      cM.confMenu();
      cM.display();
    }
    
    if (smMode) {
      sMe.confMenu();
      sMe.display();
    }
    if (shMode) {
      store.update();
    }
    if (gameMode) {
      sG.display(); 
      //rect(0, height-100, width, 100);
      p.update();
      p.display();
      p.keyCheck();
      p.collisionCheck();
      if(p.location.y >= displayHeight){
        
      }
    }

    if (qSMode) {
      spacePressed = false;
      spacePressed();
      qS.update(this);
      qS.display();
      println(spacePressed);
      if (qS.getDone() && spacePressed) {
        qSMode = false;
        gameMode = true;
        sceneSetup();
      }
    }
  }

  public void sceneSetup() {
    if (qSMode) {
      qS = new QScreen();
      spaceReleased = true;
    } else if (gameMode){
      startup();
      }else if(shMode) {
      }else if (controlMode){
      } else {
     smMode = true;
     
    }
  }

  public void spacePressed() {
    if (keyPressed && key == ' ' && this.spaceReleased) {
      spacePressed = true;
      spaceReleased = false;
    } else if (!keyPressed && key == ' ') {
      spacePressed = false;
      spaceReleased = true;
    } else if (keyPressed && key == ' ' && !this.spaceReleased) {
      spacePressed = false;
    }
  }
}
