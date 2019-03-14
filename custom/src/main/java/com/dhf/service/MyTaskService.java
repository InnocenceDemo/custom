package com.dhf.service;

import com.dhf.domain.PageBean;

import java.util.Map;

public interface MyTaskService {
    PageBean<Map<String,Object>> selectAllMyTasks(Integer userId,Integer currPage);
}
