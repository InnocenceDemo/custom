package com.dhf.service.impl;

import com.dhf.domain.User1;
import com.dhf.mapper.User1Mapper;
import com.dhf.service.User1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class User1ServiceImpl implements User1Service {

    @Autowired
    private User1Mapper user1Mapper;

    @Override
    public Integer reg(User1 user1) {
        int i = user1Mapper.reg(user1);
        return i;
    }

    @Override
    public int checkReg(String name1) {
        int i = user1Mapper.checkReg(name1);
        return i;
    }

    @Override
    public User1 checkLogin(User1 user1) {
        User1 user = user1Mapper.checkLogin(user1);
        return user;
    }

    @Override
    public Integer selectUserSkillExist(Integer userId) {
        return user1Mapper.selectUserSkillExist(userId);   }

    @Override
    public void updateTaskWokerId(Integer userId,Integer id) {
        Map map = new HashMap();
        map.put("userId",userId);
        map.put("id",id);
        user1Mapper.updateTaskWokerId(map);
    }
}
