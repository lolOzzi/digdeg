package com.NirAkashot.app;
import processing.core.PApplet;

class QBox extends PApplet {

    int posx;
    int posy;
    int size;
    boolean overRect;

    public QBox(int posx, int posy, int size){
        this.posx = posx;
        this.posy = posy;
        this.size = size;

        square(posx, posy, size);
    }

	 boolean OverRect()  {
		if (mouseX >= posx && mouseX <= posx+size && 
			mouseY >= posy && mouseY <= posy+size) {
		  return true;
		} else {
		  return false;
		}
	  }

      public boolean getOverRect() {
            return OverRect();
      }
}