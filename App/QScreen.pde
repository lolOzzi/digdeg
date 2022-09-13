

class QScreen {
  Question q1 = new Question(new String("Er Rin sej?"), new String("ja"), new String[] { "ja", "maybe", "nej", "no way bro" });
  int size = 50;
  ArrayList<Question> qList = new ArrayList<>();

  public QScreen() {
    background(10);
  }

  public void display() {
    q1.display();
    for (int i = 0; i<q1.getQBList().size(); i++)
    {
      q1.getQBList().get(i).display();
    }
  }
  public void update() {
    if (mousePressed) {
      for (int i = 0; i < q1.getQBList().size(); i++) {
        if (q1.getQBList().get(i).OverRect()) {
          if (q1.getOpts()[i].equals(q1.ans)) {
            println("du har ret");
            q1.getQBList().get(i).setRAns(true);
            q1.getQBList().get(i).display();
          }
        }
      }
    }
  }
}
