package com.dhf.service.impl;

import com.dhf.mapper.TaskMapper;
import com.dhf.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;


    @Override
    public List<Map<String, Object>> selectTasksByCode(String code) {
        return taskMapper.selectTasksByCode(code);
    }
}
