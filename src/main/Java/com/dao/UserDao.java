package com.dao;

import com.MyAnnotation;
import com.pojo.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

      List<User> getUserInfo();
      String findPwd(String account);
}
