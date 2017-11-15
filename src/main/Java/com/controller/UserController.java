package com.controller;


import com.pojo.User;

import com.service_api.UserService_api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService_api us;

    @RequestMapping(value = "getUserInfo",method = RequestMethod.GET)
    public String getUserInfo(){

        List<User> userInfos = us.getUserInfoInfo();
        System.out.println("list:"+userInfos);
        return "main";
    }
    @RequestMapping(value = "showUser",method = RequestMethod.GET)
    public String showUser(){

        List<User> userInfos = us.getUserInfoInfo();
        System.out.println("list:"+userInfos);
        return "User";
    }
}

