package com.dhf.mapper;

import java.util.Map;

public interface SkillSubmitMapper {
    Integer InsertUserSkillMessage(Map map);

    Integer selectUserSkillIsExist(Integer userId);

    Integer updateUserSkillMessage(Map map);
}
