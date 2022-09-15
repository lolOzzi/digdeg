public class StageGenerator {
float numberOfPlatforms = 3;
float posX =  displayWidth/numberOfPlatforms;
float screenWidthDifference = displayWidth/1920f;
float screenHeightDifference = displayHeight/1080f;

public StageGenerator () {

    for (float i = 0;i <= numberOfPlatforms;i++){

        if (i == 0) {
         rectMode(CORNER);
         rect(posX*i,880*screenHeightDifference, 300*screenWidthDifference, 40);
         
        }else if (i < numberOfPlatforms){
        rectMode(CORNER);
        sdf.add.(rect(posX*i-300,1200-random(150, 300), 200*random(2.5,3), 40));
        } 
        
        else {
         rectMode(CORNER);
         rect(posX*i,880*screenHeightDifference, -300*screenWidthDifference, 40);
        }
    }
}