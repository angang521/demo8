package com.test;

import java.util.UUID;

public class Test {
    public static void main(String[] args) {
        String token22 = UUID.randomUUID().toString().replace("-", "");
        System.out.println(token22);
    }
}
