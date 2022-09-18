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
      qbList.add(new QBox(100, 100*i, size, opts[i]));
    }
  }
  public void display() {
    if (!cat.equals("Problemregning")) {
      PShape formula = PTeX.toPShape(qn, 100, color(0, 200, 255), color(255));
      shape(formula, 100, 50);
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
