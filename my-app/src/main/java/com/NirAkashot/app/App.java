package com.NirAkashot.app;

import java.util.ArrayList;

import processing.core.PApplet;

public class App extends PApplet {
	Question q1 = new Question(new String("Er Rin sej?"), new String("ja"), new String[] { "ja", "ja", "nej", "nej" } );

	public void settings() {
		fullScreen(2);
	}
	public void draw(){
		background(64);
		ellipse(mouseX, mouseY, 20, 20);
		int pad = 150;
		ArrayList<QBox> qbList = new ArrayList<>();

		qbList.add(new QBox(width/4 + pad, height/4, 100));
		qbList.add(new QBox(3*width/4 - pad, 3*height/4, 100));
		qbList.add(new QBox(width/4 + pad, 3*height/4, 100));
		qbList.add(new QBox(3*width/4 - pad, height/4, 100));

	}
	public void mousePressed() {
		int pad = 150;
		if (QBox.OverRect()) {
			if (q1.getOpts()[0].equals(q1.ans)) {
				println("du har ret");
			}
		}
		else if (overRect(3*width/4 - pad, 3*height/4, 100)) {
			if (q1.getOpts()[1].equals(q1.ans)) {
				println("du har ret");
			}
		}
		else if (overRect(width/4 + pad, 3*height/4, 100)) {
			if (q1.getOpts()[2].equals(q1.ans)) {
				println("du har ret");
			}
		}
		else if (overRect(3*width/4 - pad, height/4, 100)) {
			if (q1.getOpts()[3].equals(q1.ans)) {
				println("du har ret");
			}
		}
	}


	public static void main(String[] passedArgs) {
		
		PApplet.runSketch(new String[] { "com.NirAkashot.app.App" }, new App());
    }
}

