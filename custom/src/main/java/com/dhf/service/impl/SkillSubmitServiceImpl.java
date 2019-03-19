package com.dhf.service.impl;

import com.dhf.mapper.SkillSubmitMapper;
import com.dhf.service.SkillSubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class SkillSubmitServiceImpl implements SkillSubmitService{
    @Autowired
    SkillSubmitMapper skillSubmitMapper;
    @Override
    public Integer InsertUserSkillMessage(String skill, Integer skill_grade, String skill_file, String skill_address, Integer userId) {
        Map map = new HashMap();
        map.put("skill",skill);
        map.put("skill_grade",skill_grade);
        map.put("skill_file",skill_file);
        map.put("skill_address",skill_address);
        map.put("userId",userId);
        return skillSubmitMapper.InsertUserSkillMessage(map);
    }

    @Override
    public Integer selectUserSkillIsExist(Integer userId) {
        return skillSubmitMapper.selectUserSkillIsExist(userId);
    }

    @Override
    public Integer updateUserSkillMessage(String skill, Integer skill_grade, String skill_file, String skill_address, Integer userId) {
        Map map = new HashMap();
        map.put("skill",skill);
        map.put("skill_grade",skill_grade);
        map.put("skill_file",skill_file);
        map.put("skill_address",skill_address);
        map.put("userId",userId);
        return skillSubmitMapper.updateUserSkillMessage(map);
    }
}
