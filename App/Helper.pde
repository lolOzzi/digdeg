class Helper {
  PImage wImg;


  PImage flip(PImage image) {
    PImage reverse = new PImage( image.width, image.height, ARGB);
    for ( int i=0; i < image.width; i++ ) {
      for (int j=0; j < image.height; j++) {
        reverse.set( image.width - 1 - i, j, image.get(i, j) );
      }
    }
    return reverse;
  }
  ArrayList<PImage> loadImages(String dir) {
    //String dir = (dataPath("") + "\\imgs\\player\\weapons");
     ArrayList<PImage> imageList = new ArrayList<>();
    File dirFile = new File( (dataPath("") + "/" + dir));
    for (File img : dirFile.listFiles()) {
      imageList.add(loadImage(dir + img.getName()));
    }
    return imageList;
  }
  public  boolean OverRect(float posX, float posY, float sizeX, float sizeY) {
    if (mouseX >= posX && mouseX <= posX+sizeX &&
      mouseY >= posY && mouseY <= posY+sizeY) {
      return true;
    } else {
      return false;
    }
  }
}
