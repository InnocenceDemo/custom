package com.dhf.service.impl;

import com.dhf.domain.User1;
import com.dhf.domain.UserDetail;
import com.dhf.mapper.MyinformationMapper;
import com.dhf.service.MyinformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Character.getType;

@Service
public class MyinformationServiceImpl implements MyinformationService {

    @Autowired
    private MyinformationMapper myinformationMapper;
    @Override
    public Map<String, Object> selectMyinformation(Integer id) {
        return myinformationMapper.selectMyinformation(id);
    }

    @Override
    public List<Map<String, Object>> selectMyTasks(Integer userId) {
        List<Map<String, Object>> taskList = myinformationMapper.selectMyTasks(userId);
        return taskList;
    }

    @Override
    public Map<String, Object> selectMyinformationByuserId(Integer userId) {
        return myinformationMapper.selectMyinformationByuserId(userId);
    }

    @Override
    public Integer updateUserMessage(User1 user1, UserDetail userDetail) {
        return myinformationMapper.updateUserMessage(user1,userDetail);
    }
}
