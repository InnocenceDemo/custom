package com.dhf.service.impl;

import com.dhf.mapper.ProvinceMapper;
import com.dhf.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<Map<String, Object>> selectAllProvinces() {
        return provinceMapper.selectAllProvinces();
    }
}
