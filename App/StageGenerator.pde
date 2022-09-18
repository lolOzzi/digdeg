public class StageGenerator {

 float numberOfPlatforms = 4;
float posX =  displayWidth/numberOfPlatforms;
float firstPlatform =  displayWidth/4;
float secondPlatform =  (displayWidth/2)+firstPlatform;
float heightDifference = 200;

float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;
  ArrayList<PVector> locations = new ArrayList<>();
  ArrayList<PVector> sizes = new ArrayList<>();
  
  
  void generate(){
     for(float i = 0; i < numberOfPlatforms; i++){
       
        if (i == 0) {


        locations.add(new PVector(posX*i,880*screenHeightDifference));
        sizes.add(new PVector(300*screenWidthDifference, 40));
        
        }else if (i < numberOfPlatforms - 1){
        locations.add(new PVector(posX*i-300,1200-random(150, 300)));
        sizes.add(new PVector(posX/2.5 * random(2,2.5), 40));
        } 
        
        else {
        locations.add(new PVector(posX*i,880*screenHeightDifference));
        sizes.add(new PVector(300*screenWidthDifference, 40));
      }
    
    }
  }
  
  void display(){
    for (int i = 0; i < numberOfPlatforms; i++){
    if (i == 0){
      
      rect(locations.get(i).x, locations.get(i).y, sizes.get(i).x, sizes.get(i).y);
      //rect(100, 900, 319, 40);
      //println(locations.get(i).x + "  " + locations.get(i).y + "  " + sizes.get(i).x + "  " + sizes.get(i).y);
      //print(i);
    }
    
    if (i < numberOfPlatforms - 1){
      rectMode(CORNER);
      rect(locations.get(i).x, locations.get(i).y, sizes.get(i).x, sizes.get(i).y);
      //print(i);
    }
    else {
    rectMode(CORNER);
    fill(0, 255, 0);
    rect(locations.get(i).x, locations.get(i).y, sizes.get(i).x, sizes.get(i).y);
    fill(255);
    //println(i);
    }

    }
  }
}
