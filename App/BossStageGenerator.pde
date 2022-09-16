/*
public class BossStageGenerator {
float numberOfPlatforms = 4;
float posX =  displayWidth/numberOfPlatforms;
float firstPlatform =  displayWidth/4;
float secondPlatform =  (displayWidth/2)+firstPlatform;
float heightDifference = 200;

float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;
ArrayList<PVector> bossLocations = new ArrayList<>();
ArrayList<PVector> bossSizes = new ArrayList<>();
  

void bossStageGenerate  () {
for (float i = 0;i <= numberOfPlatforms;i++){

        if (i == 0) {
          bossLocations.add(new PVector(posX*i,880*screenHeightDifference));
          bossSizes.add(new PVector(300*screenWidthDifference, 40));
        } else if (i < numberOfPlatforms) {
          if (heightDifference == 200) {
          bosslocations.add(new PVector(secondPlatform,720*screenHeightDifference-heightDifference));
          bossSizes.add(new PVector(posX/2.5*screenWidthDifference, 40));  
          
          } else {
          bosslocations.add(new PVector(firstPlatform,1040*screenHeightDifference));
          bossSizes.add(new PVector(posX/2*screenWidthDifference, 40));  
          }
         secondPlatform = secondPlatform/2;
         heightDifference = heightDifference * -1;
         } else {
          bosslocations.add(new PVector(posX*i,880*screenHeightDifference));
          bossSizes.add(new PVector(-300*screenWidthDifference, 40));
        }
    }
}
void display(){
    for (int i = 0; i < numberOfPlatforms; i++){
    if (i == 0){
      
      rect(bosslocations.get(i).x, bosslocations.get(i).y, bossSizes.get(i).x, bossSizes.get(i).y);
      //rect(100, 900, 319, 40);
      //println(locations.get(i).x + "  " + locations.get(i).y + "  " + sizes.get(i).x + "  " + sizes.get(i).y);
      //print(i);
    }
    
    if (i < numberOfPlatforms - 1){
      rectMode(CORNER);
      rect(bosslocations.get(i).x, bosslocations.get(i).y, bossSizes.get(i).x, bossSizes.get(i).y);
      //print(i);
    }
    else {
    rectMode(CORNER);
    fill(0, 255, 0);
    rect(bosslocations.get(i).x, bosslocations.get(i).y, BossSizes.get(i).x, bossSizes.get(i).y);
    fill(255);
    //println(i);
    }

    }
  }
}
*/
