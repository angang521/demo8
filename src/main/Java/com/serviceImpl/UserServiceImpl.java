package com.serviceImpl;

import com.dao.UserDao;
import com.pojo.User;
import com.service_api.UserService_api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService_api {

   @Autowired
   private UserDao ud;

    public List<User> getUserInfoInfo() {
        return ud.getUserInfo();
    }
}
