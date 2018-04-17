package com.serviceImpl;

import com.dao.UserDao;
import com.pojo.User;
import com.service_api.UserService_api;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@Service
public class UserServiceImpl implements UserService_api {

    @Autowired
    private UserDao ud;

    @Autowired
    private UserService2_Impl user_aip2;
    private static Logger logger = Logger.getLogger(String.valueOf(Test.class));


    public List<User> getUserInfoInfo(String id) {
        logger.info("getUserInfoInfo: 你好");

        User xiaoming = user_aip2.getUserById(id);
        System.out.println(xiaoming);
        return ud.getUserInfo();
    }

    @Override
    public void runDriverCommentEvaluation(int shardTotal, int currentShard) {
        List<User> userInfo = ud.getUserInfo();
        System.out.println("定时任务在跑：shardTota:" + shardTotal + "currentShard:" + currentShard);
    }
}
