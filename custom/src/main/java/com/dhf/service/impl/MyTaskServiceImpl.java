package com.dhf.service.impl;

import com.dhf.domain.PageBean;
import com.dhf.mapper.MyTaskMapper;
import com.dhf.service.MyTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyTaskServiceImpl implements MyTaskService{

    @Autowired
    private MyTaskMapper myTaskMapper;
    @Override
    public PageBean<Map<String, Object>> selectAllMyTasks(Integer userId,Integer currPage) {
        PageBean<Map<String, Object>> pageBean1 = new PageBean<>();
        //封装当前页数
        pageBean1.setCurrPage(currPage);
        //封装每页显示的记录数
        int pageSize = 10;
        pageBean1.setPageSize(pageSize);
        //封装总记录数
        int totalCount = myTaskMapper.selectAllMyTasksCount(userId);
        pageBean1.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/pageSize);
        pageBean1.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage-1) * pageSize;
        Map map = new HashMap();
        map.put("userId", userId);
        map.put("pageSize", pageSize);
        map.put("begin", begin);
        List<Map<String, Object>> worker = myTaskMapper.selectAllMyTasks(map);
        pageBean1.setList(worker);
        return pageBean1;
    }
}
