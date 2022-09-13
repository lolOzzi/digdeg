
class QBox {

    int posx;
    int posy;
    int size;
    String text; 
    boolean overRect;
    boolean rAns;

    public QBox(int posx, int posy, int size, String text){
        this.posx = posx;
        this.posy = posy + 200;
        this.size = size;
        this.text = text;

    }
    
    public void display(){
      if (rAns) {
        fill(0, 255, 0);
      }
      square(posx, posy, size);
      textAlign(LEFT);
      textSize(60);

      text(text, posx + size + 20, posy + size/2 + 15);
      fill(255);
    }
    
     public boolean getRAns(){ return rAns; }
     public void setRAns(boolean nRAns){ this.rAns = nRAns; }

	public  boolean OverRect()  {
		if (mouseX >= posx && mouseX <= posx+size && 
			mouseY >= posy && mouseY <= posy+size) {
		  return true;
		} else {
		  return false;
		}
	}

}
