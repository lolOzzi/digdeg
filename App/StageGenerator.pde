public class StageGenerator {
float numberOfPlatforms = 3;
float ewr =  width/numberOfPlatforms;

public StageGenerator ()

    for (float i = 0;i <= numberOfPlatforms;i++){

        if (i == 0) {
         rect(ewr*i,1200, 200*random(1, 2), 40);
         
        }else if (i < numberOfPlatforms){
        rectMode(CORNER);
        sdf.add.(rect(ewr*i-300,1200-random(150, 300), 200*random(2.5,3), 40));
        } 
        
        else {
         rect(ewr*i,1200, -200*random(1,2), 40);
        }

}