class StartMenu{
  
  
  PImage shop;
  PImage quit;
  PImage start;
  PImage controls;
  PImage titel;
  boolean mPressed;
  float screenWidthDifference;
  float screenHeightDifference;
  ArrayList<PImage> images;
  ArrayList<PVector> size;
  ArrayList<PVector> pos;
  
  StartMenu(){
  
  }

  void confMenu() {
    mPressed = false;
    screenWidthDifference = displayWidth/1920f;
    screenHeightDifference = displayHeight/1080f;
    images = new ArrayList<>();
    size = new ArrayList<>();
    pos = new ArrayList<>();
    images.add(loadImage("imgs/Startmenu/Shop.png"));
    images.add(loadImage("imgs/Startmenu/Start.png"));
    images.add(loadImage("imgs/Startmenu/Controls.png"));
    images.add(loadImage("imgs/Startmenu/Quit.png"));
    images.add(loadImage("imgs/Startmenu/Titel.png"));
    size.add(new PVector(31*20, 13*20)); // size Shop 
    size.add(new PVector(31*28, 13*28)); // size Start
    size.add(new PVector(45*20, 13*20)); // size Controls
    size.add(new PVector(31*20, 13*20)); // size Quit
    size.add(new PVector(65*20, 22*20)); // size Titel
    pos.add(new PVector(0, 900*screenHeightDifference)); // pos Shop
    pos.add(new PVector((displayWidth/2)-31*14, (displayHeight/2)-13*14)); // pos Start
    pos.add(new PVector(637.5*screenWidthDifference, (900*screenHeightDifference))); // pos Controls
    pos.add(new PVector(1462.5*screenWidthDifference, 900*screenHeightDifference)); // pos Quit
    pos.add(new PVector((displayWidth/2)-65*10, 80)); // pos Titel
  }

  void display () {
    ellipse(mouseX, mouseY, 20, 20);
    checkMouse();
    for (int i = 0; i < images.size(); i++) {
     
        image(images.get(i), pos.get(i).x, pos.get(i).y, size.get(i).x,size.get(i).y); // draw Images 
        
        if (mPressed && OverRect(pos.get(i).x, pos.get(i).y, size.get(i).x,size.get(i).y)){
          if (i == 0){
          //Shop();
      
          mPressed = false;
          print("shop");
          }else if(i==1){
          //startup();
   
          mPressed = false;
          print("start");
          }else if(i ==2){
          mPressed = false;
          print("Controls");
          }else if(i==3){
           exit(); 
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

  void checkMouse() {
    if (mousePressed)
      mPressed = true;
  }
}
