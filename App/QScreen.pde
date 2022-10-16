class QScreen {
  Question q1;
  int size = 50;
  ArrayList<Question> qList = new ArrayList<>();
  boolean done;
  int n;

  public QScreen() {
    background(10);

    qList = makeQList();
    n = Math.round(random(qList.size()-1));
    q1 = qList.get(n);
  }

  public void display() {
    q1.display();
    for (int i = 0; i<q1.getQBList().size(); i++)
    {
      q1.getQBList().get(i).display();
    }
  }
  public void update(SceneManager sM) {
    if (sM.mPressed) {
      sM.mPressed = false;
      for (int i = 0; i < q1.getQBList().size(); i++) {
        QBox cQB = q1.getQBList().get(i);
        if (cQB.OverRect() && !done && !cQB.chosen) {
          chooseQuestion(cQB);
        }
      }
    }
    if (sM.spacePressed) {
      for (int i = 0; i < q1.getQBList().size(); i++) {
        QBox cQB = q1.getQBList().get(i);    
        if (cQB.chosen && !done) {
          acceptQuestion(cQB, q1, i);
          sM.spacePressed = false;
        }
      }
    }
  }

  public void chooseQuestion(QBox cQB) {

    for (int i = 0; i < q1.getQBList().size(); i++) {
      q1.getQBList().get(i).setChosen(false);
      q1.getQBList().get(i).display();
    }

    if (!cQB.chosen) {
      cQB.setChosen(true);
    }
    cQB.display();
  }

  public void acceptQuestion(QBox cQB, Question q1, int i) {

    if (q1.getOpts()[i].equals(q1.ans)) {
      cQB.setRAns(true);
      cQB.display();
      done = true;
    } else {
      cQB.setWAns(true);
      cQB.display();
      done = true;
    }
  }
  public ArrayList<Question> makeQList() {
    ArrayList<Question> qList = new ArrayList<>();
    String[] lines = loadStrings("qs.txt");
    for (String a : lines) {
      String[] qArr = a.split(";");
      qList.add( new Question(qArr[0], Integer.parseInt(qArr[1]), qArr[2], qArr[3], new String[] { qArr[4], qArr[5], qArr[6], qArr[7] }));
    }
    return qList;
  }

  public boolean getDone() {
    return done;
  }
}
