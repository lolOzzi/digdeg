public class Weapons{
    int damage, range, cost;
    float cooldown, startCD;
    boolean canAttack = true;
    

    void attack(PVector pLocation, float playerWidth){
      if(p.facingLeft == true) 
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
      range = 50;
      cooldown = 2;
      startCD = millis();
    }
    
    Weapons(int damage, int range, float cooldown, int cost){
      this.damage = damage;
      this.range = range;
      this.cooldown = cooldown;
      this.cost = cost;
      startCD = millis();
    }
}
