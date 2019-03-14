package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface MyinformationMapper {
    Map<String,Object> selectMyinformation(Integer id);

    List<Map<String,Object>> selectMyTasks(Integer userId);
}
