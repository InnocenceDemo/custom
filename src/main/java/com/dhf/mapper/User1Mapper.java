package com.dhf.mapper;

import com.dhf.domain.User1;

import java.util.Map;

public interface User1Mapper {

    //根据phone查询对应记录的数量
//    int selectCountsByPhone(Long phone);
    //注册用户
    int reg(User1 user1);
    //检查注册
    int checkReg(String name1);
    //检查登录
    User1 checkLogin(User1 user1);
    //检查是否是专业人士
    Integer selectUserSkillExist(Integer userId);
    //修改任务信息中的wokerId
    void updateTaskWokerId(Map map);
    //根据用户id更改用户头像
//    int updateHead_urlById(Userinfo userinfo);
}
