class Helper {

  PImage flip(PImage image) {
    PImage reverse = new PImage( image.width, image.height, ARGB);
    for ( int i=0; i < image.width; i++ ) {
      for (int j=0; j < image.height; j++) {
        reverse.set( image.width - 1 - i, j, image.get(i, j) );
      }
    }
    return reverse;
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
