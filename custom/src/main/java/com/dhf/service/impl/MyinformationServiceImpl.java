package com.dhf.service.impl;

import com.dhf.mapper.MyinformationMapper;
import com.dhf.service.MyinformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
}
