class Animation { //<>//
  PImage[] images;
  int imageCount;
  int frame;
  float framerate;
  int cFCount;
  boolean flipped;

  Animation(String imagePrefix, String imageSuffix, int count, float framerate, boolean flipped) {
    imageCount = count;
    images = new PImage[imageCount];
    this.framerate = 30;
    this.framerate = framerate;
    this.flipped = flipped;

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, String.valueOf(count).length()) + imageSuffix;
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float xsize, float ysize) {
    if (cFCount >= (float) frameRate / (float) framerate) {
      frame = (frame+1) % imageCount;
      cFCount = 0;
    } else {
      frame = (frame) % imageCount;
    }

    if (flipped) {
      image(h.flip(images[frame]), xpos, ypos, xsize, ysize);
    } else {
      image(images[frame], xpos, ypos, xsize, ysize);
    }
    cFCount++;
  }
  void display(float xpos, float ypos) {
    if (cFCount >= Math.round(30f / (float) framerate)) {
      frame = (frame+1) % imageCount;
      cFCount = 0;
    } else {
      frame = (frame) % imageCount;
    }
    if (flipped) {
      image(h.flip(images[frame]), xpos, ypos);
    } else {
      image(images[frame], xpos, ypos);
    }
    cFCount++;
  }
  int getWidth() {
    return images[0].width;
  }
}
