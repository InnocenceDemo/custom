package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface MyTaskMapper {
    List<Map<String, Object>> selectAllMyTasks(Map map);
    Integer selectAllMyTasksCount(Integer userId);
}
