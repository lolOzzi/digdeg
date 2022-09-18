public class BossStageGenerator {

  int distance = displayWidth - 1000;

  void bossStageGenerate  () {
    coinList.clear();
    coinList.add(new Coin(new PVector(128, 30), 0, new PVector(240/2, 240/2)));
    sG.locations.clear();
    sG.sizes.clear();
    p = new Player();
    enemies.clear();
    sG.numberOfPlatforms = 5;
    boss = new Boss();
    enemies.add(boss);
    for (float i = 0; i < sG.numberOfPlatforms; i++) {
      if (i == 0) {
        sG.locations.add(new PVector(0, displayHeight - 300));
        sG.sizes.add(new PVector(400, 40));
      } else if (i < sG.numberOfPlatforms - 2) {
        sG.locations.add(new PVector(sG.sizes.get(0).x + (distance*(i-1)), displayHeight - 600));
        sG.sizes.add(new PVector(200, 40));
      } else if (i < sG.numberOfPlatforms - 1) {
        sG.locations.add(new PVector(sG.locations.get(1).x + sG.sizes.get(1).x, displayHeight - 40));
        sG.sizes.add(new PVector(sG.locations.get(2).x - (sG.locations.get(1).x + sG.sizes.get(1).x), 40));
      } else {
        sG.locations.add(new PVector(displayWidth - 400, displayHeight - 300));
        sG.sizes.add(new PVector(400, 40));
      }
    }
  }


  void display() {
    sG.display();
  }

  BossStageGenerator() {
  }
}
