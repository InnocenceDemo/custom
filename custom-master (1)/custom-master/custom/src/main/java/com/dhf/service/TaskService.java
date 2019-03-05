package com.dhf.service;

import com.dhf.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface TaskService {

    PageBean<Map<String,Object>> selectTasksByCodeByPage(String code, Integer currPage);
}
