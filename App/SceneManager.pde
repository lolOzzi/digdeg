class SceneManager {
  QScreen qS;
  boolean spacePressed;
  boolean spaceReleased;
  boolean mPressed;
  boolean qSMode;
  boolean dMode;

  public SceneManager() {
    sceneSetup();
  }

  public void update() {

    if (qSMode) {
      spacePressed = false;
      spacePressed();
      qS.update(this);
      qS.display();
      println(spacePressed);
      if (qS.getDone() && spacePressed) {
        qSMode = false;
        dMode = true;
        sceneSetup();
      }
    }
  }
  public void sceneSetup() {
    if (qSMode) {
      qS = new QScreen();
      spaceReleased = true;
    } else {
      dMode = true;
      startup();
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
