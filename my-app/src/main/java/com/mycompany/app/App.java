package com.mycompany.app;

import processing.core.PApplet;

public class App extends PApplet {

	public void settings() {
		fullScreen();
	}

	public void draw(){
		background(64);
		ellipse(mouseX, mouseY, 20, 20);
	}
  
	public static void main(String[] passedArgs) {
		PApplet.runSketch(new String[] { "com.mycompany.app.App" }, new App());
    }
}

