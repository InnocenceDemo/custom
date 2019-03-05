package com.dhf.service;

import java.util.List;
import java.util.Map;

public interface GenreService {

    List<Map> selectGenresByCategroyId(Integer categoryId);
}
