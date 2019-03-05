package com.dhf.mapper;

import java.util.List;
import java.util.Map;

public interface GenreMapper {

    List<Map> selectGenresByCategroyId(Integer categoryId);
}
