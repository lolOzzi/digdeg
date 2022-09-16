PImage shop;
PImage quit;
PImage start;
PImage controls;
PImage titel;
boolean mPressed = false;
float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;
ArrayList<PImage> images = new ArrayList<>();
ArrayList<PVector> size = new ArrayList<>();
ArrayList<PVector> pos = new ArrayList<>();

void setup() {

  fullScreen();
  background(0, 200, 255);
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
  pos.add(new PVector(0, 1200)); // pos Shop
  pos.add(new PVector((displayWidth/2)-31*14, (displayHeight/2)-13*14)); // pos Start
  pos.add(new PVector(850, 1200)); // pos Controls
  pos.add(new PVector(1950, 1200)); // pos Quit
  pos.add(new PVector((displayWidth/2)-65*10, 80)); // pos Titel
}

void draw () {
  background(0, 200, 255);
  ellipse(mouseX, mouseY, 20, 20);
  for (int i = 0; i < images.size()-1; i++) {
   
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

public  boolean OverRect(float posX, float posY, float sizeX, float sizeY) {
  if (mouseX >= posX && mouseX <= posX+sizeX &&
    mouseY >= posY && mouseY <= posY+sizeY) {
    return true;
  } else {
    return false;
  }
}
void mousePressed() {
  mPressed = true;
}
