package com.dhf.service;

import com.dhf.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface TaskService {

    Integer selectTasksByCode(String code);

    PageBean<Map<String, Object>> findByPaging(String code, Integer currPage);

    PageBean<Map<String,Object>> selectTasksByCategoryId(Integer categoryId,String code,Integer currPage);
}
