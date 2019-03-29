package com.dhf.service.impl;

import com.dhf.mapper.GenreMapper;
import com.dhf.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GenreServiceImpl implements GenreService {

    @Autowired
    private GenreMapper genreMapper;

    @Override
    public List<Map> selectGenresByCategroyId(Integer categoryId) {
        return genreMapper.selectGenresByCategroyId(categoryId);
    }

    @Override
    public String selectGenreById(Integer categoryId) {
        return genreMapper.selectGenreById(categoryId);
    }
}
