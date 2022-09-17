
class QBox {

  int posx;
  int posy;
  int size;
  String text;
  boolean overRect;
  boolean rAns; //Right Answer
  boolean wAns; //Wrong Answer
  boolean chosen;


  public QBox(int posx, int posy, int size, String text) {
    this.posx = posx;
    this.posy = posy + 300;
    this.size = size;
    this.text = text;
  }

  public void display() {
    if (rAns) {
      fill(0, 255, 0);
    } else if (wAns) {
      fill(255, 0, 0);
    }
    square(posx, posy, size);
    if (chosen && !rAns && !wAns) {
      fill(60);
      rectMode(CENTER);
      square(posx + size/2, posy + size/2, size/1.5);
      rectMode(CORNER);
      fill(255);
    }
    textAlign(LEFT);
    textSize(60);

    text(text, posx + size + 20, posy + size/2 + 15);
    fill(255);
  }

  public boolean getRAns() {
    return rAns;
  }
  public void setRAns(boolean nRAns) {
    this.rAns = nRAns;
  }
  public void setWAns(boolean nWAns) {
    this.wAns = nWAns;
  }
  public void setChosen(boolean nChosen) {
    this.chosen = nChosen;
  }
public  boolean OverRect() {
    if (mouseX >= posx && mouseX <= posx+size &&
      mouseY >= posy && mouseY <= posy+size) {
      return true;
    } else {
      return false;
    }
 }
 
}
