package com.test;

import java.util.Date;

public class DemoTest {
    private int x;
    private int y;

    private Date date=new Date();
    public DemoTest() {
    }

    public DemoTest(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "DemoTest{" +
                "x=" + x +
                ", y=" + y +
                ", date=" + date +
                '}';
    }
}
