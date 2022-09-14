public class Weapons{


    int damage, speed, range;
    boolean facingLeft; // True er venstre - False er Højre
    float cooldown;
    

    void attack(PVector pLocation, float playerWidth){
      if(facingLeft == true) 
      rect(pLocation.x, pLocation.y, (range *-1) + playerWidth, 10); // Width = Range, Range mod Left subtraheres med Player størrelse
      else rect(pLocation.x, pLocation.y, range, 10);
    }
    
    Weapons(){
    damage = 10;
    speed = 1;
    range = 30;
    cooldown = 2;
    }
}
