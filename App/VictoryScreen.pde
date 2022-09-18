public class VictoryScreen {
float screenWidthDifference;
float screenHeightDifference;
ArrayList<PImage> vImages;
ArrayList<PVector> vSize;
ArrayList<PVector> vPos;

VictoryScreen() {
}
void confMenu() {
    background(0, 200, 255);
    screenWidthDifference = displayWidth/1920f;
    screenHeightDifference = displayHeight/1080f;
    vImages = h.loadImages("imgs/menu/victoryScreen/"); // Victory - 0, Next - 1, Menu - 2
    vSize = new ArrayList<>();
    vPos = new ArrayList<>();
    for (PImage img : vImages) {
      vSize.add(new PVector(img.width , img.height));
    }
    vPos.add(new PVector(((displayWidth/2) - vSize.get(0).x / 2), ((displayHeight/2) - vSize.get(0).y / 2))); // pos Victory
    vPos.add(new PVector(vPos.get(0).x + (vSize.get(0).x/2)+20, vSize.get(0).y*0.94)); // pos Next
    vPos.add(new PVector(vPos.get(0).x + (vSize.get(2).x/4),  vSize.get(0).y*0.94)); // pos Menu
  }

  void display () {

    for (int i = 0; i < vImages.size(); i++) {
      image(vImages.get(i), vPos.get(i).x, vPos.get(i).y, vSize.get(i).x, vSize.get(i).y); // draw Images
    }
    if (sM.mPressed) {
      sM.mPressed = false;
      for (int i = 0; i < vImages.size(); i++) {


        if ( h.OverRect(vPos.get(i).x, vPos.get(i).y, vSize.get(i).x, vSize.get(i).y)) {
          if (i == 1) {
            startup();
            sM.scene = 'G';
          } else if (i==2) {
            sM.scene = 'M';
          }
        }
      }
    }
  }
}
