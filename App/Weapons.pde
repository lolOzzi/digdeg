public class Weapons{


    int damage, speed, range;
    boolean facingLeft; // True er venstre - False er Højre
    float cooldown;
    

    void attack(PVector pLocation){
      if(facingLeft == true) 
      rect(pLocation.x, pLocation.y, -20, 10); // Width = Range, Range mod Left subtraheres med Player størrelse
      else rect(pLocation.x, pLocation.y, 30, 10);
    }
}
