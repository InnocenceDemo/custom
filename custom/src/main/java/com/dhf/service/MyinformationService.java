package com.dhf.service;

import java.util.List;
import java.util.Map;

public interface MyinformationService {
    Map<String, Object> selectMyinformation(Integer id);
    List<Map<String,Object>> selectMyTasks(Integer userId);
}
