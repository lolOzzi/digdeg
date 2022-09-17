public class Shop{
  float distance;
  boolean swordOwned;
  PImage back;
  PVector backSizes;
  
  void weaponList(){
    stone = new Weapons(5, 52, 2, 0);
    giant = new Weapons(50, 120, 5, 5);
    fire = new Weapons(21, 62, 1.8, 3);
    iron = new Weapons(12, 62, 2, 2);
    swords = new Weapons[]{stone, iron, fire, giant};
    distance = displayWidth/swords.length;
  }
  
  
  void display(){
    float multiplierWidth = displayWidth/1920f;
    float multiplierHeight = displayHeight/1080f;
    for (int i = 0; i < swords.length; i++){
      fill(50);
      rect(i*distance, 0, distance, displayHeight);
      fill(200);
      textSize(104*multiplierWidth); 
      text(str(swords[i].damage), distance*i + 200, 400*multiplierHeight);
      textSize(50*multiplierWidth);
      back = loadImage("imgs/Startmenu/Back.png"); 
      backSizes = new PVector(33*20, 10*20);
      image(back, displayWidth-backSizes.x, displayHeight-backSizes.y ,backSizes.x, backSizes.y );
      if (i == 0){
        text("Stone Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      } else if (i == 1) {
          text("Iron Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      } else if (i == 2) {
          text("Fire Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      } else if (i == 3) { 
      text("Giant Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      }
      textSize(40*multiplierWidth);
      text(new String("Damage: " + str(swords[i].damage)), ((distance-distance/4)*i)*multiplierWidth, 600*multiplierHeight + 100*1);
      text(new String("Range: " + str(swords[i].range)), ((distance-distance/4)*i)*multiplierWidth, 600*multiplierHeight + 100*2);
      text(new String("Cooldown: " + str(swords[i].cooldown)), ((distance-distance/4)*i)*multiplierWidth, 600*multiplierHeight + 100*3);
      isSwordOwned(swords[i]);
      if (swordOwned == true) {
      text("Owned", ((distance-distance/4)*i)*multiplierWidth, 600*multiplierHeight + 100*4);
      } else {
      text(new String("Cost: " + str(swords[i].cost)), ((distance-distance/4)*i)*multiplierWidth, 600*multiplierHeight + 100*4);
      }
      if (sM.mPressed && h.OverRect(displayWidth-backSizes.x, displayHeight-backSizes.y ,backSizes.x, backSizes.y )){
           sM.gameMode = false;
           sM.shMode = false;
           sM.qSMode = false;
           sM.controlMode = false;
           sM.smMode = true;
           sM.mPressed = false;
      }
    }
  }
  
  void buyWeapon(){
  if (mousePressed && !h.OverRect(displayWidth-backSizes.x, displayHeight-backSizes.y ,backSizes.x, backSizes.y )){
    for (int i = 0; i < swords.length; i++){
      if (distance*i < mouseX && mouseX < distance*(i+1))
      {
        isSwordOwned(swords[i]);
        if (!swordOwned){
          ownedWeapons.add(swords[i]);
        }
      }
    }
    }
  }
  
  void update(){
    display();
    buyWeapon();
  
  } 
  
 
  void isSwordOwned(Weapons sword){
    
    swordOwned = false;
    for (Weapons sw : ownedWeapons) if (sw.equals(sword)) swordOwned = true;
  }

  Shop(){
  }

}
