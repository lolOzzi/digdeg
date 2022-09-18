public class StageGenerator {
int numberOfPlatforms = 7;
float posX =  displayWidth/numberOfPlatforms;
float firstPlatform =  displayWidth/4;
float secondPlatform =  (displayWidth/2)+firstPlatform;
float ewr =  displayWidth/numberOfPlatforms;
float heightDifference = 200;

float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;
  ArrayList<PVector> locations = new ArrayList<>();
  ArrayList<PVector> sizes = new ArrayList<>();
  
  
void generate(){
    //println(displayWidth);
    //println(ewr);
     for(float i = 0; i < numberOfPlatforms; i++){
       
        if (i == 0) {
        locations.add(new PVector(ewr*i, displayHeight - 300));
        sizes.add(new PVector(ewr - 20*random(1,2), 40));
        
        }else if (i < numberOfPlatforms - 1){
        locations.add(new PVector(ewr*i, ((displayHeight-300)-random(100, 300))));
        sizes.add(new PVector(ewr/2.5 * random(2,2.5), 40));
        } 
        
        else {
        locations.add(new PVector(ewr*numberOfPlatforms - 300, displayHeight - 300));
        sizes.add(new PVector(200*1.5, 40));
      }
    
    }
  }
  
  void display(){
    for (int i = 0; i < numberOfPlatforms; i++){
    if (i == 0){
      
      rect(locations.get(i).x, locations.get(i).y, sizes.get(i).x, sizes.get(i).y);
    }
    
    if (i < numberOfPlatforms - 1){
      rectMode(CORNER);
      rect(locations.get(i).x, locations.get(i).y, sizes.get(i).x, sizes.get(i).y);
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
