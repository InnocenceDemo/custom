package com.dhf.service;

import com.dhf.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface WorkerService {
    //查找所有专业人士
    PageBean<Map<String,Object>> selectAllWorkerMessage(String code, Integer page);
    //查看专业人士的任务清单
    List<Map<String,Object>> selectWorkerAllTasks(Integer userId);
    Map<String, Object> selectWorkerMessage(Integer userId);
}
