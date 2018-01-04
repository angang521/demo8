package com.test;

public class A {
    private String score;
    private String fun;
    private String love;

    @Override
    public String toString() {
        return "A{" +
                "score='" + score + '\'' +
                ", fun='" + fun + '\'' +
                ", love='" + love + '\'' +
                '}';
    }

    public A(String score, String fun, String love) {
        this.score = score;
        this.fun = fun;
        this.love = love;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getFun() {
        return fun;
    }

    public void setFun(String fun) {
        this.fun = fun;
    }

    public String getLove() {
        return love;
    }

    public void setLove(String love) {
        this.love = love;
    }

    public A() {

    }
}
