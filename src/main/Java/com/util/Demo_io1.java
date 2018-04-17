package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;


public class Demo_io1 {
    private static InputStream in = null;
    private static Properties pro;
    private static FileInputStream stream;    //把代码放在静态代码块中，是为了在new对象时能够首先执行代码块

    {
        try {
            //通过反射获取InputStream流
            //注意：db.properties 与Demo_IO.java 放在同一包下
            stream = new FileInputStream("src\\main\\java\\com\\util\\aa.txt");

            in = Demo_io1.class.getResourceAsStream("aa.txt");
            System.out.println(stream);
            System.out.println(new File(".").getAbsolutePath());


            //创建Properties对象
            pro = new Properties();
            //将输入流载入properties对象中
            pro.load(in);


        } catch (IOException e1) {
            e1.printStackTrace();
        }

    }


    public void readProperties() {
        //获取Properties 文件中属性，并输出
        System.out.println(pro.getProperty("name"));
        System.out.println(pro.getProperty("password"));

    }

}

