package com.elastic_job;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;
import com.service_api.UserService_api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyElasticJob implements SimpleJob{
    @Autowired
    private UserService_api us;

    @Override
    public void execute(ShardingContext context) {
        int currentShard = context.getShardingItem();
        int shardTotal = context.getShardingTotalCount();
        System.out.println("/////////////////////");
        System.out.println(context);
        System.out.println("/////////////////////");
        us.runDriverCommentEvaluation(shardTotal,currentShard);
    }

}
