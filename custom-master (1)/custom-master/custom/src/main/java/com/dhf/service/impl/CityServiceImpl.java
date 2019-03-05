package com.dhf.service.impl;


import com.dhf.mapper.CityMapper;
import com.dhf.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;


    @Override
    public List<Map<String, Object>> selectAllCitys() {
        return cityMapper.selectAllCitys();
    }

    @Override
    public Map<String, Object> selectCityByCode(String code) {
        return cityMapper.selectCityByCode(code);
    }

}
