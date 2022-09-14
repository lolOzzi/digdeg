class SceneManager {
  QScreen qS;
  int cool;
  boolean spacePressed;
  boolean spaceReleased;
  boolean mPressed;

  public SceneManager() {
    qS = new QScreen();
    cool = 0;
    spaceReleased = true;
  }

  public void update() {
    spacePressed = false;
    spacePressed();
    qS.update(this);
    qS.display();
    println(spacePressed);
    if (qS.getDone() && spacePressed) {
      qS = new QScreen();
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
