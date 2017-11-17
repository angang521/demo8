package com.serviceImpl;

import com.dao.UserDao;
import com.pojo.User;
import com.service_api.UserService_api;
import com.test.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

@Service
public class UserServiceImpl implements UserService_api {

   @Autowired
   private UserDao ud;

    private static Logger logger = Logger.getLogger(String.valueOf(Test.class));


    public List<User> getUserInfoInfo() {
        logger.info("getUserInfoInfo: 你好");
      // logger.error("error");
        //logger.warn("warn");

        return ud.getUserInfo();
    }
}
