package com.NirAkashot.app;

class Question {

    String qn;
    String ans;
    String[] opts;

    public Question(String qn, String ans, String[] opts){
        this.qn = qn;
        this.ans = ans;
        this.opts = opts;
    }

    public String getQn(){ return qn; }
    public String getAns(){ return ans; }
    public String[] getOpts(){ return opts; }
}