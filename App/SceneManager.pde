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
    case 'I':
      sI.display();
      break;
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
      textSize(128);
      text(str(coins), 0, 128);
      if (p.location.y >= displayHeight) {
        scene = 'Q';
        sM.sceneSetup();
        sM.update();
      }
      if (p.location.x >= displayWidth && p.location.y < sG.locations.get(sG.numberOfPlatforms - 1).y) {
        if (level < 4) {
          sG.locations.clear();
          sG.sizes.clear();
          enemies.clear();
          sG.generate();
          startup();
          coinList.clear();
        } else {
          bSG.bossStageGenerate();
          scene = 'B';
        }
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
      if (qS.getDone() && spacePressed) {
        scene = 'G';
        correct.play();
        sceneSetup();
      }
      break;

    case 'C':
      cM.confMenu();
      cM.display();
      break;

    case 'B':
      textSize(128);
      text(str(coins), 0, 128);
      bSG.display();
      p.update();
      p.display();
      p.keyCheck();
      p.collisionCheck();
      boss.bossUpdate();
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
      scene = 'I';
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
