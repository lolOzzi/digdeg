class StartMenu{
  
  PImage shop;
  PImage quit;
  PImage start;
  PImage controls;
  PImage titel;

  float screenWidthDifference;
  float screenHeightDifference;
  ArrayList<PImage> images;
  ArrayList<PVector> size;
  ArrayList<PVector> pos;
  
  StartMenu(){
  
  }
  void confMenu() {
    background(0,200,255);
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
    size.add(new PVector(31*16, 13*16)); // size Shop - 0 
    size.add(new PVector(31*22.4, 13*22.4)); // size Start - 1
    size.add(new PVector(45*16, 13*16)); // size Controls - 2
    size.add(new PVector(31*16, 13*16)); // size Quit - 3
    size.add(new PVector(65*16, 22*16)); // size Titel - 4
    pos.add(new PVector(0, displayHeight-size.get(0).y)); // pos Shop
    pos.add(new PVector((displayWidth/2)-31*11.2, (displayHeight/2)-13*11.2)); // pos Start
    pos.add(new PVector(637.5*screenWidthDifference, displayHeight-size.get(2).y)); // pos Controls
    pos.add(new PVector(displayWidth-size.get(3).x, displayHeight-size.get(3).y)); // pos Quit
    pos.add(new PVector((displayWidth/2)-65*8, 30 * screenHeightDifference)); // pos Titel
  }

  void display () {
    for (int i = 0; i < images.size(); i++) {
     
        image(images.get(i), pos.get(i).x, pos.get(i).y, size.get(i).x,size.get(i).y); // draw Images 
       
        if (sM.mPressed && h.OverRect(pos.get(i).x, pos.get(i).y, size.get(i).x,size.get(i).y)){
           sM.mPressed = false;
          if (i == 0){
          sM.smMode = false;
          sM.shMode = true;
          sM.mPressed = false;
          print("shop");
          
          }else if(i==1){
            sM.smMode = false;
          startup();
          sM.gameMode = true;
          
          sM.mPressed = false;
          print("start");
          
          }else if(i ==2){
          sM.smMode = false;
          sM.controlMode = true;
          print("Controls");
          
          }else if(i==3){
           exit(); 
          }
    }
    }
  }
}
