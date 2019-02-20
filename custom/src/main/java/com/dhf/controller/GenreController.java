package com.dhf.controller;

import com.alibaba.fastjson.JSON;
import com.dhf.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/genre")
public class GenreController {

    @Autowired
    private GenreService genreService;

    @RequestMapping("/selectGenresByCategoryId")
    public void selectGenresByCategoryId(Integer categoryId, HttpServletResponse response) throws IOException {
        List<Map> genres = genreService.selectGenresByCategroyId(categoryId);
        Map map = new HashMap();
        map.put("genres", genres);
        response.getWriter().write(JSON.toJSONString(map));
    }
}
