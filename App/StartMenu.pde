class StartMenu {

  float screenWidthDifference;
  float screenHeightDifference;
  ArrayList<PImage> images;
  ArrayList<PVector> size;
  ArrayList<PVector> pos;

  StartMenu() {
  }
  void confMenu() {
    background(0, 200, 255);
    screenWidthDifference = displayWidth/1920f;
    screenHeightDifference = displayHeight/1080f;
    images = h.loadImages("imgs/menu/startmenu/"); // Shop - 0, Start - 1, Controls - 2, Quit - 3, Titel - 4
    size = new ArrayList<>();
    pos = new ArrayList<>();
    for (PImage img : images) {
      size.add(new PVector(img.width * 0.6, img.height * 0.6));
    }
    size.get(1).x *= 1.5;
    size.get(1).y *= 1.5;
    size.get(4).x *= 1.5;
    size.get(4).y *= 1.5;

    pos.add(new PVector(0 + 12, displayHeight-size.get(0).y - 12)); // pos Shop
    pos.add(new PVector(((displayWidth/2) - size.get(1).x / 2), ((displayHeight/2) - size.get(1).y / 2) + 60)); // pos Start
    pos.add(new PVector(((displayWidth/2) - size.get(2).x / 2), displayHeight-size.get(2).y - 12)); // pos Controls
    pos.add(new PVector((displayWidth-size.get(3).x) - 12, displayHeight-size.get(3).y - 12)); // pos Quit
    pos.add(new PVector(((displayWidth/2) - size.get(4).x / 2), 30 * screenHeightDifference + 12)); // pos Titel
  }

  void display () {

    for (int i = 0; i < images.size(); i++) {
      image(images.get(i), pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y); // draw Images
    }
    if (sM.mPressed) {
      sM.mPressed = false;
      for (int i = 0; i < images.size(); i++) {
        if ( h.OverRect(pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y)) {
          if (i == 0) {
            sM.scene = 'S';
            print("shop");
          } else if (i==1) {
            startup();
            sM.scene = 'G';
            print("start");
          } else if (i ==2) {
            sM.scene = 'C';
            print("Controls");
          } else if (i==3) {
            exit();
          }
        }
      }
    }
  }
}
