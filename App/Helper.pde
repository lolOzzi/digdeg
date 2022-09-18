class Helper {
  ArrayList<PImage> weaponImages = new ArrayList<>();
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
  ArrayList<PImage> loadWeaponImages() {
    String dir = (dataPath("") + "\\imgs\\player\\weapons");
    File dirFile = new File(dir);
    for (File img : dirFile.listFiles()){
     weaponImages.add(loadImage("imgs/player/weapons/" + img.getName()));
    }
    return weaponImages;
  }
  
}
