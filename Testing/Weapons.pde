public class Weapons{


    int damage, speed, range;
    boolean facingLeft; // True er venstre - False er Højre
    float cooldown, startCD;
    boolean canAttack = true;
    

    void attack(PVector pLocation, float playerWidth){
      if(facingLeft == true) 
      rect(pLocation.x, pLocation.y, (range *-1) + playerWidth, 10); // Width = Range, Range mod Left subtraheres med Player størrelse
      else rect(pLocation.x, pLocation.y, range, 10);
      startCD = millis();
    }
    
    void countdown(){
      if (startCD+(cooldown*1000) <= millis())
        canAttack = true;
      else if (startCD+(cooldown*1000) >= millis())
        canAttack = false;
    }
    
    Weapons(){
      damage = 10;
      speed = 1;
      range = 50;
      cooldown = 2;
      startCD = millis();
    }
    
    Weapons(int damage, int speed, int range, float cooldown){
      this.damage = damage;
      this.speed = speed;
      this.range = range;
      this.cooldown = cooldown;
      startCD = millis();
    }
}
