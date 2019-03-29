package com.dhf.service;

import java.util.List;
import java.util.Map;

public interface CityService {

    List<Map<String,Object>> selectAllCitys();
    Map<String,Object> selectCityByCode(String code);
    List<Map> selectCityByprovCode(String provCode);
}
