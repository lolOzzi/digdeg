public class Weapons {


  int damage, range, cost, size;
  float cooldown, startCD;
  int type;  //-1 = custom, 0  = stone, 1 = iron,  2 = fire, 3 = big sword
  boolean canAttack = true;
  ArrayList<PImage> weaponImgs;




  void countdown() {
    if (startCD+(cooldown*1000) <= millis())
      canAttack = true;
    else if (startCD+(cooldown*1000) >= millis())
      canAttack = false;
  }

  Weapons() {
    damage = 10;
    range = 50;
    cooldown = 2;
    startCD = millis();
  }

  Weapons(int type, int damage, int range, float cooldown, int cost) {
    this.type = type;
    this.damage = damage;
    this.range = range;
    this.cooldown = cooldown;
    this.cost = cost;
    startCD = millis();
  }
}
