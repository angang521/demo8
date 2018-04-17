package com.controller;

import com.BaseSpringTest;
import com.pojo.User;
import org.junit.Test;

import java.util.logging.Logger;


public class UserControlleeTest extends BaseSpringTest {

    private static Logger logger = Logger.getLogger(String.valueOf(Test.class));

    @Test
    public void getUserInfoTest() {
        User user = new User();
        user.setUserName("xiao ming");
        user.setPassword("123");
        mock(user);
        String userInfo = userController.getUserInfo();
        System.out.println(userInfo);


    }
}
