package com.dhf.service.impl;

import com.dhf.domain.PageBean;
import com.dhf.mapper.WorkerMapper;
import com.dhf.service.WorkerService;
import org.omg.CORBA.MARSHAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WokerServiceImpl implements WorkerService{

    @Autowired
    private WorkerMapper workerMapper;

    @Override
    public PageBean<Map<String, Object>> selectAllWorkerMessage(String code, Integer currPage) {
        PageBean<Map<String,Object>> pageBean1 = new PageBean();
        //封装当前页数
        pageBean1.setCurrPage(currPage);
        //封装每页显示的记录数
        int pageSize = 6;
        pageBean1.setPageSize(pageSize);
        //封装总记录数
        int totalCount = workerMapper.selectWorkerByCode(code);
        pageBean1.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/pageSize);
        pageBean1.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage-1) * pageSize;
        Map map = new HashMap();
        map.put("code", code);
        map.put("pageSize", pageSize);
        map.put("begin", begin);
        List<Map<String, Object>> worker = workerMapper.selectAllWorkerMessage(map);
        pageBean1.setList(worker);
        return pageBean1;
    }

    @Override
    public List<Map<String, Object>> selectWorkerAllTasks(Integer userId) {
        List<Map<String, Object>> taskList = workerMapper.selectWorkerAllTasks(userId);
        return taskList;
    }

    @Override
    public Map<String, Object> selectWorkerMessage(Integer userId) {
        return workerMapper.selectWorkerMessage(userId);
    }
}
