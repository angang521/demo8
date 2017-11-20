package com.service_api;


import com.pojo.User;

import java.util.List;

public interface UserService_api {
    public List<User> getUserInfoInfo(String id);

    public void runDriverCommentEvaluation(int shardTotal, int currentShard);
}
