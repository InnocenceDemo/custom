package com.dhf.service.impl;

import com.dhf.mapper.CreateRequestMapper;
import com.dhf.service.CreateRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CreateRequestServiceImpl implements CreateRequestService{
    @Autowired
    private CreateRequestMapper createRequestMapper;
    @Override
    public Integer InsertCreateRequestMessage(Integer userId, String date, Integer categoryId, String category, String bonus, String maxbonus, String desc, String address,String nowDate) {
        Map map = new HashMap();
        map.put("userId",userId);
        map.put("date",date);
        map.put("categoryId",categoryId);
        map.put("category",category);
        map.put("bonus",bonus);
        map.put("maxbonus",maxbonus);
        map.put("desc",desc);
        map.put("address",address);
        map.put("nowDate",nowDate);
        return createRequestMapper.InsertCreateRequestMessage(map);
    }
}
