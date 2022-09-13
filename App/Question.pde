
class Question {

    String qn;
    String ans;
    String[] opts;
    int size;
    ArrayList<QBox> qbList = new ArrayList<>();
    

    public Question(String qn, String ans, String[] opts){
        this.qn = qn;
        this.ans = ans;
        this.opts = opts;
        int size = 50;
        for (int i = 0; i < opts.length; i++) {
            qbList.add(new QBox(100, 100*i, size, opts[i]));
        }

    }
    public void display() {
      text(qn, 100, 100);
    }
    public String getQn(){ return qn; }
    public String getAns(){ return ans; }
    public String[] getOpts(){ return opts; }
    public ArrayList<QBox> getQBList(){ return qbList; }
}
