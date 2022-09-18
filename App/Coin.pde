class Coin extends Enemy {
  int value;
  HashMap<String, Animation> cAnimList = new HashMap<>();

  Coin(PVector location, int value) {
    hp = 1;
    speed = 0;
    this.value = value;
    gravity = new PVector(0, 0);
    size = new PVector(240/4, 240/4);
    this.location = location;
    velocity = new PVector(0, 0);
    animSetup();
  }
  
  Coin(PVector location, int value, PVector size){
    hp = 1;
    speed = 0;
    this.value = value;
    gravity = new PVector(0, 0);
    this.size = size;
    this.location = location;
    velocity = new PVector(0, 0);
    animSetup();
  }


  void display() {
    cAnimList.get("Spin").display(location.x, location.y, size.x, size.y);
  }

  void animSetup() {
    cAnimList.put("Spin", new Animation("imgs/coin/sprite_", ".png", 10, 12, false));
  }
}
