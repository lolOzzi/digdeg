public class Shop {
  float distance;
  boolean swordOwned;


  void weaponList() {
    stone = new Weapons(0, 5, (int) Math.sqrt(2*Math.pow(weaponImages.get(0).width / 5, 2)), 0.5, 0);
    iron = new Weapons(1, 12, (int) Math.sqrt(2*Math.pow(weaponImages.get(1).width / 5, 2)), 0.75, 2);
    fire = new Weapons(2, 21, (int) Math.sqrt(2*Math.pow(weaponImages.get(2).width / 5, 2)), 0.65, 3);
    giant = new Weapons(3, 50, (int) Math.sqrt(2*Math.pow(weaponImages.get(3).width / 5, 2)), 1.5, 5);

    swords = new Weapons[]{stone, iron, fire, giant};
    ownedSwords = new ArrayList<>();

    for (int i = 0; i < ownedSwords.size(); i++){
      if (i == 0){
        ownedWeapons.add(stone);
      }if (i == 1){
        ownedWeapons.add(iron);
      }if (i == 2){
        ownedWeapons.add(fire);
      }if (i == 3){
        ownedWeapons.add(giant);
      }

    }
    distance = displayWidth/swords.length;
  }


  void display() {
    float multiplierWidth = displayWidth/1080;
    float multiplierHeight = displayHeight/1080;
    for (int i = 0; i < swords.length; i++) {
      fill(50);
      rect(i*distance, 0, distance, displayHeight);
      fill(200);

      textSize(104*multiplierWidth);
      imageMode(CENTER);
      image(weaponImages.get(i), (i+1)*distance/2 + i*distance/2, 300*multiplierHeight);
      imageMode(CORNER);
      //text(str(swords[i].damage), distance*i + 200, 400*multiplierHeight);
      textSize(50*multiplierWidth);
      if (i == 0) text("Stone Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      else if (i == 1) text("Iron Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      else if (i == 2) text("Fire Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      else if (i == 3) text("Giant Sword", distance*i + 100*multiplierWidth, 600*multiplierHeight);
      textSize(40*multiplierWidth);
      text(new String("Damage: " + str(swords[i].damage)), (distance*i + 100)*multiplierWidth, 600*multiplierHeight + 100*1);
      text(new String("Range: " + str(swords[i].range)), (distance*i + 100)*multiplierWidth, 600*multiplierHeight + 100*2);
      text(new String("Cooldown: " + str(swords[i].cooldown)), (distance*i + 100)*multiplierWidth, 600*multiplierHeight + 100*3);
      isSwordOwned(swords[i]);
      if (swordOwned == true) text("Owned", (distance*i + 100)*multiplierWidth, 600*multiplierHeight + 100*4);
      else text(new String("Cost: " + str(swords[i].cost)), (distance*i + 100)*multiplierWidth, 600*multiplierHeight + 100*4);
    }
  }

  void buyWeapon() {
    if (mousePressed == true) {
      for (int i = 0; i < swords.length; i++) {
        if (distance*i < mouseX && mouseX < distance*(i+1))
        {
          isSwordOwned(swords[i]);
          if (!swordOwned && coins >= swords[i].cost) {
            ownedWeapons.add(swords[i]);
            coins -= swords[i].cost;
            equipped = swords[i];
            buyUpdate(i);
          } else if (ownedWeapons.contains(swords[i]))
          {
            equipped = swords[i];
          }
        }
      }
    }
  }

  void buyUpdate(int i) {
    if (db.connect()) {
      db.query( String.format("SELECT * FROM Player WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
      while (db.next()) {
        if (i == 0) {
          db.query(String.format("UPDATE Player SET hasStone = 1 WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
        }
        if (i == 1) {
          db.query(String.format("UPDATE Player SET hasIron = 1 WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
        }
        if (i == 2) {
          db.query(String.format("UPDATE Player SET hasFire = 1 WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
        }
        if (i == 3) {
          db.query(String.format("UPDATE Player SET hasGiant = 1 WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
        }
        db.query(String.format("UPDATE Player SET coins = " + coins + " WHERE (password == '%s' AND username == '%2s')", sI.inputPassword, sI.inputUsername));
      }
    }
  }

  void update() {
    display();
    buyWeapon();
  }

  void isSwordOwned(Weapons sword) {
    swordOwned = false;
    for (Weapons sw : ownedWeapons) if (sw.equals(sword)) swordOwned = true;
  }

  Shop() {
  }
}
