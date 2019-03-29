package com.dhf.mapper;

import com.dhf.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface TaskMapper {

    Integer selectTasksByCode(String code);

    List<Map<String,Object>> findByPaging(Map map);

    List<Map<String,Object>> selectTasksByCategoryId(Map map);

    Integer selectTasksByCategoryIdAndCode(Map map1);
}
