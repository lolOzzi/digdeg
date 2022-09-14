import latex.*;

SceneManager sM;

void setup() {
  fullScreen(2);
  sM = new SceneManager();
}

void draw() {
  background(64);
  ellipse(mouseX, mouseY, 20, 20);
  sM.update();
}


void mousePressed() {
  sM.mPressed = true;
}
