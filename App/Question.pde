class Question {
  String cat;
  int lvl;
  String qn;
  String ans;
  String[] opts;
  int size;
  ArrayList<QBox> qbList = new ArrayList<>();


  public Question(String cat, int lvl, String qn, String ans, String[] opts) {
    this.qn = qn;
    this.ans = ans;
    this.opts = opts;
    this.cat = cat;
    this.lvl = lvl;
    int size = 50;
    for (int i = 0; i < opts.length; i++) {
      qbList.add(new QBox(displayWidth - 600, 100 + 250*(i-1), size, opts[i]));
    }
  }
  public void display() {
    background(64);
    if (!cat.equals("Problemregning")) {
      PShape formula = PTeX.toPShape(qn, 100, color(64), color(255));
      shape(formula, displayWidth/2 - formula.width/2 - 150, displayHeight/2 - formula.height/2);
    } else {
      text(qn, 100, 150);
    }
  }
  public String getQn() {
    return qn;
  }
  public String getAns() {
    return ans;
  }
  public String[] getOpts() {
    return opts;
  }
  public ArrayList<QBox> getQBList() {
    return qbList;
  }
}
