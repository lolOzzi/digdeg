public class BossStageGenerator {
float numberOfPlatforms = 4;
float posX =  displayWidth/numberOfPlatforms;
float firstPlatform =  displayWidth/4;
float secondPlatform =  (displayWidth/2)+firstPlatform;
float heightDifference = 200;

float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;

public class BossStageGenerator () {
for (float i = 0;i <= numberOfPlatforms;i++){

        if (i == 0) {
         rect(posX*i,880*screenHeightDifference, 300*screenWidthDifference, 40);
        } else if (i < numberOfPlatforms) {
          if (heightDifference == 200) {
          rect(secondPlatform,720*screenHeightDifference-heightDifference, 200*screenWidthDifference, 40);
          } else {
          rect(firstPlatform,1040*screenHeightDifference, 1400, 40);
          }
         secondPlatform = secondPlatform/2;
         heightDifference = heightDifference * -1;
            
         } else {
         rect(posX*i,880*screenHeightDifference, -300*screenWidthDifference, 40);
        }
    }
}
}
