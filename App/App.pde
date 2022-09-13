
  QScreen qS;


	 void setup() {
		fullScreen(2);
		//size(500, 500);
    qS = new QScreen();
}
	 void draw(){
		background(64);
		ellipse(mouseX, mouseY, 20, 20);
    qS.display();
    qS.update();
	}
/*
	void mousePressed() {
      for (int i = 0; i < qbList.size(); i++) {
      if (qbList.get(i).OverRect()) {
        if (q1.getOpts()[i].equals(q1.ans)) {
          println("du har ret");
        }
      }
    }
    
	}
*/
