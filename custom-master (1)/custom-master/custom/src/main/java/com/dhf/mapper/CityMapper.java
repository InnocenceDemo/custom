package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface CityMapper {

    List<Map<String, Object>> selectAllCitys();
    Map<String, Object> selectCityByCode(String code);
}
