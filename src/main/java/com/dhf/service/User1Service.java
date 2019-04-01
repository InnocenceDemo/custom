package com.dhf.service;

import com.dhf.domain.User1;

import java.io.IOException;

public interface User1Service {

    Integer reg(User1 user1);
    int checkReg(String name1);
    User1 checkLogin(User1 user1);
    Integer selectUserSkillExist(Integer userId);

    void updateTaskWokerId(Integer user1,Integer id);

    //根据用户id更改用户头像
    int updateImageById(User1 user1);
}
