package com.dhf.service;

import com.dhf.domain.User1;
import com.dhf.domain.UserDetail;

import java.util.List;
import java.util.Map;

public interface MyinformationService {
    Map<String, Object> selectMyinformation(Integer id);
    List<Map<String,Object>> selectMyTasks(Integer userId);
    Map<String, Object> selectMyinformationByuserId(Integer userId);
    Integer updateUserMessage(User1 user, UserDetail userDetail);
}
