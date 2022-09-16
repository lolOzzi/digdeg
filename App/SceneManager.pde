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
    sceneSetup();
  }

  public void update() {
    
    if (controlMode){
      
    }
    
    if (smMode) {
      // indsæt start screen class
    }
    if (shMode) {
      // indsæt christians shop class
    }
    if (gameMode) {
      startup();
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
