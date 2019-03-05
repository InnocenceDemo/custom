package com.dhf.service.impl;

import com.dhf.domain.PageBean;
import com.dhf.mapper.TaskMapper;
import com.dhf.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public PageBean<Map<String, Object>> selectTasksByCodeByPage(String code, Integer currPage) {
        PageBean<Map<String, Object>> pageBean = new PageBean();
        //封装当前页数
        pageBean.setCurrPage(currPage);
        //封装每页显示的记录数
        int pageSize = 15;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = taskMapper.selectCountsByCode(code);
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc/pageSize);
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage-1)*pageSize;
        Map map = new HashMap();
        map.put("code", code);
        map.put("begin", begin);
        map.put("pageSize", pageSize);
        List<Map<String, Object>> tasks = taskMapper.selectTasksByCodeAndPage(map);
        pageBean.setList(tasks);
        return pageBean;
    }
}
