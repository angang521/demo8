package com.controller;


import com.dao.UserDao;
import com.pojo.User;
import com.service_api.UserService_api;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class UserController {

    @Autowired
    private UserService_api us;

    @Autowired
    private UserDao ud;

    private static Logger logger = Logger.getLogger(String.valueOf(Test.class));

    @RequestMapping(value = "toLoggin", method = RequestMethod.POST)
    public String toLoggin(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String account = (String) request.getParameter("account");
        String pwd = (String) request.getParameter("pwd");
        String pwd1 = ud.findPwd(account);
        if (pwd.equals(pwd1)) {
            return "main";
        } else {
            return "index.jsp";
        }

    }

    @RequestMapping(value = "getUserInfo", method = RequestMethod.GET)
    public String getUserInfo() {

        logger.info("mian:start");
        List<User> userInfos = us.getUserInfoInfo("111");
        System.out.println("list:" + userInfos);
        return "main";
    }

    @RequestMapping(value = "showUser", method = RequestMethod.GET)
    public String showUser() {

        // logger.warning("showUser:可能失败");
        List<User> userInfos = us.getUserInfoInfo("111");
        System.out.println("list:" + userInfos);
        System.out.println("list:" + userInfos);
        return "User";
    }

    @RequestMapping(value = "getJson", method = RequestMethod.POST)
    public String getJson() {
        List<User> userInfos = us.getUserInfoInfo("111");
        System.out.println("list:" + userInfos);
        System.out.println("list:" + userInfos);
        return "User";
    }

}

