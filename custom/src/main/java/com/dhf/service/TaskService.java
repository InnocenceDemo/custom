package com.dhf.service;

import java.util.List;
import java.util.Map;

public interface TaskService {

    List<Map<String,Object>> selectTasksByCode(String code);
}
