class Controls{
  PImage controlPicture;
  PImage quit;
  float screenWidthDifference;
  float screenHeightDifference;
  ArrayList<PImage> controlImages;
  ArrayList<PVector> controlSize;
  ArrayList<PVector> controlPos;
  
  
  Controls(){
  
  }
  void confMenu() {
    background(0,200,255);
    screenWidthDifference = displayWidth/1920f;
    screenHeightDifference = displayHeight/1080f;
    controlImages = new ArrayList<>();
    controlSize = new ArrayList<>();
    controlPos = new ArrayList<>();
    controlImages.add(loadImage("imgs/Startmenu/controlPicture.png"));
    controlImages.add(loadImage("imgs/Startmenu/Quit.png"));
    controlSize.add(new PVector(31*16, 13*16)); // size controlPicture 
    controlSize.add(new PVector(31*16, 13*16)); // size Quit
    controlPos.add(new PVector((displayWidth/2) - (controlSize.get(0).x)/2, (displayHeight/2) - (controlSize.get(0).y)/2)); // pos controlPicture
    controlPos.add(new PVector(displayWidth-controlSize.get(1).x, displayHeight-controlSize.get(1).y)); // pos Quit
  }

  void display () {
    for (int i = 0; i < controlImages.size(); i++) {
     
        image(controlImages.get(i), controlPos.get(i).x, controlPos.get(i).y, controlSize.get(i).x,controlSize.get(i).y); // draw Images 
        
        if (sM.mPressed && OverRect(controlPos.get(i).x, controlPos.get(i).y, controlSize.get(i).x,controlSize.get(i).y)){
          sM.mPressed = false;                   
           if(i==1){
           sM.gameMode = false;
           sM.shMode = false;
           sM.qSMode = false;
           sM.controlMode = false;
           sM.smMode = true;
           sM.mPressed = false;
          }
    }
  }
}
  public boolean OverRect(float posX, float posY, float sizeX, float sizeY) {
    if (mouseX >= posX && mouseX <= posX+sizeX &&
      mouseY >= posY && mouseY <= posY+sizeY) {
      return true;
    } else {
      return false;
    }
  }
}
