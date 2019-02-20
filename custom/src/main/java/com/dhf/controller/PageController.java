package com.dhf.controller;

import com.dhf.service.CategoryService;
import com.dhf.service.CityService;
import com.dhf.service.ProvinceService;
import com.dhf.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller
public class PageController {

    @Autowired
    private ProvinceService provinceService;

    @Autowired
    private CityService cityService;

    @Autowired
    private TaskService taskService;
    
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/index","/"})
    public ModelAndView goIndex(ModelAndView mv){
        List<Map> maps = categoryService.selectAllCategorys();
        mv.addObject("maps", maps);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/reg")
    public String goReg(){
        return "reg";
    }

    @RequestMapping(value = "/login" )
    public String goLogin(){
        return "login";
    }

    @RequestMapping(value = "/updateinfo")
    public String goUpdateinfo(){
        return "updateinfo";
    }

    @RequestMapping(value = "/changecity")
    public String goChangeCity(Model model){
        List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
        List<Map<String, Object>> citys = cityService.selectAllCitys();
        model.addAttribute("provinces", provinces);
        model.addAttribute("citys", citys);
        return "changecity";
    }

    @RequestMapping(value = "/index/{code}")
    public void goIndex(@PathVariable String code, ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> city = cityService.selectCityByCode(code);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Map<String, Object>> tasks = taskService.selectTasksByCode(code);
        for (Map<String, Object> map : tasks) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if (entry.getKey().equals("finishTime")) {
                    String finishTime = sdf.format(entry.getValue());
                    entry.setValue(finishTime);
                }
            }
        }
        if (tasks.size() != 0) {
            //mv.addObject("tasks", tasks);
            request.setAttribute("tasks", tasks);
        } else {
            mv.addObject("msg","抱歉，该城市目前没有待接任务！");
        }
        //mv.addObject("city", city);
        request.getSession().setAttribute("city", city);
        request.getRequestDispatcher("/index").forward(request, response);
    }

    @RequestMapping(value = "/becomeexpert")
    public String goBecomeexpert(){
        return "becomeexpert";
    }

    @RequestMapping(value = "/historychat" )
    public String goHistorychat(){
        return "historychat";
    }

    @RequestMapping(value = "/myinformation" )
    public String goMyinformation(){
        return "myinformation";
    }

    @RequestMapping(value = "/mytask")
    public String goMyTask(){
        return "mytask";
    }
}
