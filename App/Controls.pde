class Controls {
  PImage controlPicture;
  PImage back;
  float screenWidthDifference;
  float screenHeightDifference;
  ArrayList<PImage> controlImages;
  ArrayList<PVector> controlSize;
  ArrayList<PVector> controlPos;



  Controls() {
  }
  void confMenu() {
    background(0, 200, 255);
    screenWidthDifference = displayWidth/1920f;
    screenHeightDifference = displayHeight/1080f;
    controlImages = new ArrayList<>();
    controlSize = new ArrayList<>();
    controlPos = new ArrayList<>();
    controlImages.add(loadImage("imgs/menu/controls/controlPicture.png"));
    controlImages.add(loadImage("imgs/menu/controls/Back.png"));
    controlSize.add(new PVector(31*16, 13*16)); // size controlPicture
    controlSize.add(new PVector(31*16, 13*16)); // size Back
    controlPos.add(new PVector((displayWidth/2) - (controlSize.get(0).x)/2, (displayHeight/2) - (controlSize.get(0).y)/2)); // pos controlPicture
    controlPos.add(new PVector(displayWidth-controlSize.get(1).x, displayHeight-controlSize.get(1).y)); // pos Back
  }

  void display () {
    for (int i = 0; i < controlImages.size(); i++) {

      image(controlImages.get(i), controlPos.get(i).x, controlPos.get(i).y, controlSize.get(i).x, controlSize.get(i).y); // draw Images

      if (sM.mPressed && h.OverRect(controlPos.get(i).x, controlPos.get(i).y, controlSize.get(i).x, controlSize.get(i).y)) {
        sM.mPressed = false;
        if (i==1) {
          sM.scene = 'M';
        }
      } 
    }
  }
}
