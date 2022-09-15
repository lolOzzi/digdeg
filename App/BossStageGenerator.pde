public class BossStageGenerator {
float numberOfPlatforms = 3;
float totalNumberOfPlatforms =  width/numberOfPlatforms;
float firstPlatform =  width/4;
float secondPlatform =  (width/2)+firstPlatform;


for (float i = 0;i <= numberOfPlatforms;i++){

        if (i == 0) {
         rectMode(CORNER);   
         rect(posX*i,1200, 200*random(1, 2), 40);
         else if () {

         rect(secondPlatform,1200-random(150, 300), 200*random(2.5,3), 40

         secondPlatform = secondPlatform - firstPlatform;
         } else {
         rectMode(CORNER);   
         rect(posX*i,1200, -200*random(1,2), 40);
        }
}
