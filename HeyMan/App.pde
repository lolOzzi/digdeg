  Player p = new Player();

  public void settings() {
    fullScreen();

  }

  public void draw(){
    background(64);
    ellipse(mouseX, mouseY, 20, 20);
    rect(0, height-100, width, 100);
    p.update();
    p.display();
  }
