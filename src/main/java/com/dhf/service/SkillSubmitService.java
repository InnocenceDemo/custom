package com.dhf.service;

public interface SkillSubmitService {
    Integer InsertUserSkillMessage(String skill, Integer skill_grade, String skill_file, String skill_address, Integer userId);

    Integer selectUserSkillIsExist(Integer userId);

    Integer updateUserSkillMessage(String skill, Integer skill_grade, String skill_file, String skill_address, Integer userId);
}
