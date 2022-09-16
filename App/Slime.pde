public class Slime extends Enemy {


  Slime() {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(300f, 300f);
    velocity = new PVector(speed, 0);
  }

  Slime(float xCor) {
    hp = 10;
    speed = 0.1f;
    size = new PVector(60, 36);
    location = new PVector(xCor, 300f);
    velocity = new PVector(speed, 0);
  }
  Slime(int hp, float speed, int location, PVector size) {
    this.hp = hp;
    this.speed = speed;
    this.size = new PVector(60*size.x, 36*size.y);
    this.location = new PVector(location, 300f);
    velocity = new PVector(speed, 0);
  }


  void display() {
    //rect(location.x, location.y, size.x, size.y);

    if ( velocity.x == 0) {
       sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else if (equipped.facingLeft && velocity.x != 0) {
      sAnimList.get("Walk F").display(location.x, location.y, size.x, size.y);
    } else if (!equipped.facingLeft && velocity.x == 0) {
     sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    } else {
      sAnimList.get("Walk").display(location.x, location.y, size.x, size.y);
    }
  }
}