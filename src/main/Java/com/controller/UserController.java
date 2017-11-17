package com.controller;


import com.pojo.User;

import com.service_api.UserService_api;
import com.test.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class UserController {

    @Autowired
    private UserService_api us;

    private static Logger logger = Logger.getLogger(String.valueOf(Test.class));

    @RequestMapping(value = "getUserInfo",method = RequestMethod.GET)
    public String getUserInfo(){

        logger.info("mian:start");
        List<User> userInfos = us.getUserInfoInfo();
        System.out.println("list:"+userInfos);
        return "main";
    }
    @RequestMapping(value = "showUser",method = RequestMethod.GET)
    public String showUser(){

        logger.warning("showUser:可能失败");
        List<User> userInfos = us.getUserInfoInfo();
        System.out.println("list:"+userInfos);
        return "User";
    }
}

