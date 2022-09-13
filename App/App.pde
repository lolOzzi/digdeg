
QScreen qS;

void setup() {
  fullScreen(2);
  //size(500, 500);
  qS = new QScreen();
}

void draw() {
  background(64);
  ellipse(mouseX, mouseY, 20, 20);
  qS.display();
  qS.update();
}
