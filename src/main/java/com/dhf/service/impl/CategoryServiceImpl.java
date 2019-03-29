package com.dhf.service.impl;

import com.dhf.mapper.CategoryMapper;
import com.dhf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<Map> selectAllCategorys() {
        return categoryMapper.selectAllCategorys();
    }
}
