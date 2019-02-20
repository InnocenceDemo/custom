package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface TaskMapper {

    List<Map<String, Object>> selectTasksByCode(String code);
}
