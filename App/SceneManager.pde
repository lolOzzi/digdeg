class SceneManager {
  QScreen qS;
  boolean spacePressed;
  boolean spaceReleased;
  boolean mPressed;
  char scene;

  public SceneManager() {
    sceneSetup();
  }

  public void update() {
    switch(scene) {
    
    case 'V':
       vsM.confMenu();
      vsM.display();
      break;
    case 'G':
      sG.display();
      p.update();
      p.display();
      p.keyCheck();
      p.collisionCheck();
      if (p.location.y >= displayHeight) {
        print("Player Died");
        scene = 'Q';
        sM.sceneSetup();
        sM.update();
      }
      if (p.location.x >= displayWidth && p.location.y < sG.locations.get(sG.numberOfPlatforms - 1).y) {
        sG.locations.clear();
        sG.sizes.clear();
        enemies.clear();
        sG.generate();
        startup();
      }
      break;

    case 'M':
      sMe.confMenu();
      sMe.display();
      break;

    case 'S':
      store.update();
      break;

    case 'Q':
      spacePressed = false;
      spacePressed();
      qS.update(this);
      qS.display();
      println(spacePressed);
      if (qS.getDone() && spacePressed) {
        scene = 'G';
        print("I DID THIS");
        correct.play();
        sceneSetup();
      }
      break;

    case 'C':
      print("Control");
      cM.confMenu();
      cM.display();
      break;
    }
  }


  public void sceneSetup() {
    /*
    if (switcher == 'Q') {
     
     } else if (switcher == 'G'){
     
     }else if(switcher == 'S') {
     }else if (switcher == 'C'){
     } else {
     switcher = 'M';
     
     }
     */
    switch (scene) {
      
    case 'V':
     break;

    case 'Q':
      qS = new QScreen();
      spaceReleased = true;
      break;

    case 'G':
      startup();
      break;

    case 'S':
      break;

    case 'C':
      cM.confMenu();
      break;

    default:
      scene = 'M';
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
