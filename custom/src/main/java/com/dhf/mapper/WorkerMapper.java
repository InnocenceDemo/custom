package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface WorkerMapper {
//查找所有专业人士
    List<Map<String,Object>> selectAllWorkerMessage(Map map);
//统计某地区所有专业人士人数
    int selectWorkerByCode(String code);

    Map<String , Object> selectWorkerMessage(Integer userId);
    //查找专业人士的任务清单
    List<Map<String,Object>> selectWorkerAllTasks(Integer userId);
}
