package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface TaskMapper {

    List<Map<String, Object>> selectTasksByCodeAndPage(Map map);
    Integer selectCountsByCode(String code);
}
