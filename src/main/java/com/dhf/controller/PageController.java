package com.dhf.controller;

import com.alibaba.fastjson.JSON;
import com.dhf.domain.PageBean;
import com.dhf.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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

    @Autowired
    private WorkerService workerService;
    
    @Autowired
    private MyinformationService myinformationService;

    @Autowired
    private MyTaskService myTaskService;

    @Autowired
    private SkillSubmitService skillSubmitService;

    @RequestMapping(value = {"/index","/"})
    public ModelAndView goIndex(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,Model model){
        List<Map> maps = categoryService.selectAllCategorys();
        /*mv.addObject("maps", maps);*/
        request.getSession().setAttribute("maps", maps);
        if(request.getSession().getAttribute("city")==null){
            Map city = new HashMap();
            city.put("id",1);
            city.put("code",110100);
            city.put("name","北京市");
            city.put("provincecode",110000);
            request.getSession().setAttribute("city", city);
        }
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

    @RequestMapping(value = "/{userId}/updateinfo")
    public String goUpdateinfo(Model model,@PathVariable Integer userId,HttpServletRequest request){
        List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
        List<Map<String, Object>> citys = cityService.selectAllCitys();
        model.addAttribute("provinces", provinces);
        model.addAttribute("citys", citys);
        //查找个人信息
        Map<String, Object> showMyinformation = myinformationService.selectMyinformationByuserId(userId);
        request.setAttribute("showMyinformation", showMyinformation);
        //提交个人信息

        return "updateinfo";
    }

    @RequestMapping(value = "/changecity")
    public String goChangeCity(Model model,HttpServletRequest request){
        List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
        List<Map<String, Object>> citys = cityService.selectAllCitys();
        model.addAttribute("provinces", provinces);
        model.addAttribute("citys", citys);
        return "changecity";
    }

    @RequestMapping(value = "/index/{code}")
    public void goIndex(@PathVariable String code, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "1") Integer currPage, ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> city = cityService.selectCityByCode(code);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        PageBean<Map<String, Object>> pageBean = taskService.findByPaging(code, page);
        List<Map<String, Object>> tasks = pageBean.getList();
        for (Map<String, Object> map : tasks) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if (entry.getKey().equals("finishTime")) {
                    String finishTime = sdf.format(entry.getValue());
                    entry.setValue(finishTime);
                }
            }
        }
        if (tasks.size() != 0) {
            request.setAttribute("tasks", tasks);
        } else {
            request.setAttribute("msg", "抱歉，该城市目前没有待接任务！");
        }
        request.setAttribute("pageBean", pageBean);
        request.getSession().setAttribute("city", city);

        //查找该地区所有专业人士信息
        PageBean<Map<String, Object>> pageBean1 = workerService.selectAllWorkerMessage(code, currPage);
        List<Map<String, Object>> worker = pageBean1.getList();
        if (worker.size() != 0) {
            request.setAttribute("worker", worker);
        } else {
            request.setAttribute("msg1", "抱歉，该城市目前没有专业人士为您服务！");
        }
        request.setAttribute("pageBean1", pageBean1);
        request.getRequestDispatcher("/index").forward(request, response);
    }
    //实现单击专业人士头像，查看专业人士信息功能
    @RequestMapping(value = "/index/showDetail/{userId}")
    public String goWorkerMessage(@PathVariable Integer userId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> userMessage = workerService.selectWorkerMessage(userId);
        request.setAttribute("userMessage", userMessage);
        List<Map<String, Object>> taskList = workerService.selectWorkerAllTasks(userId);
        request.setAttribute("taskList",taskList);
        return "showDetail";
    }
    //实现单击技能显示查询结果
    @RequestMapping(value = "/index/{code}/{categoryId}")
    public void goClassify(@PathVariable Integer categoryId,@PathVariable String code,@RequestParam(defaultValue = "1") Integer currPage, @RequestParam(defaultValue = "1") Integer page,ModelAndView mv,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> city = cityService.selectCityByCode(code);
        PageBean<Map<String, Object>> pageBean = taskService.selectTasksByCategoryId(categoryId, code, page);
        List<Map<String, Object>> tasks = pageBean.getList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Map<String, Object> map : tasks) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if (entry.getKey().equals("finishTime")) {
                    String finishTime = sdf.format(entry.getValue());
                    entry.setValue(finishTime);
                }
            }
        }
        if (tasks.size() != 0) {
            request.setAttribute("tasks", tasks);
        } else {
            request.setAttribute("msg", "抱歉，该城市目前没有待接任务！");
        }
        request.setAttribute("pageBean", pageBean);
        request.getSession().setAttribute("city", city);
        //查找该地区所有专业人士信息
        PageBean<Map<String, Object>> pageBean1 = workerService.selectAllWorkerMessage(code, currPage);
        List<Map<String, Object>> worker = pageBean1.getList();
        if (worker.size() != 0) {
            request.setAttribute("worker", worker);
        } else {
            request.setAttribute("msg1", "抱歉，该城市目前没有专业人士为您服务！");
        }
        request.setAttribute("pageBean1", pageBean1);

        request.getRequestDispatcher("/index").forward(request,response);
    }

    @RequestMapping(value = "/becomeexpert")
    public String goBecomeexpert(Model model){
        List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
        List<Map<String, Object>> citys = cityService.selectAllCitys();
        model.addAttribute("provinces", provinces);
        model.addAttribute("citys", citys);
        return "becomeexpert";
    }
    @RequestMapping(value = "/getcity")
    public void getCityByCode(Model model,String provCode,HttpServletResponse response) throws IOException {
        List<Map> city = cityService.selectCityByprovCode(provCode);
        Map map = new HashMap();
        map.put("city",city);
        response.getWriter().write(JSON.toJSONString(map));
    }
    @RequestMapping(value = "/historychat" )
    public String goHistorychat(){
        return "historychat";
    }

    @RequestMapping(value = "/{userId}/myinformation" )
    public String goMyinformation(@PathVariable Integer userId,HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> myinformation = myinformationService.selectMyinformation(userId);
        request.setAttribute("myinformation", myinformation);
        List<Map<String, Object>> mytaskList = myinformationService.selectMyTasks(userId);
        request.setAttribute("mytaskList",mytaskList);
        return "myinformation";
    }

    @RequestMapping(value = "/{userId}/mytask")
    public String goMyTask(@RequestParam(defaultValue = "1") Integer currPage,@PathVariable Integer userId,HttpServletRequest request){
        PageBean<Map<String, Object>> pageBean = myTaskService.selectAllMyTasks(userId, currPage);
        request.setAttribute("pageBean_mytask", pageBean);
        List<Map<String, Object>> mytasks = pageBean.getList();
        if (mytasks.size() != 0) {
            request.setAttribute("mytasks", mytasks);
        } else {
            request.setAttribute("msg1", "抱歉，该城市目前没有专业人士为您服务！");
        }
        return "mytask";
    }

    @RequestMapping("/{userId}/checkskill")
    public String checkSkill(@PathVariable Integer userId, HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException {
        Integer reg = 0;
        String skill = request.getParameter("example");
        Integer skill_grade = Integer.parseInt(request.getParameter("example1"));
        String skill_file = request.getParameter("textfield");
        String skill_address = request.getParameter("city");
        //查询用户是否注册成为专业人士
        Integer isExist = skillSubmitService.selectUserSkillIsExist(userId);
        if (isExist == 0){
            reg = skillSubmitService.InsertUserSkillMessage(skill, skill_grade, skill_file, skill_address, userId);
        }else{
            reg = skillSubmitService.updateUserSkillMessage(skill, skill_grade, skill_file, skill_address,userId);
        }
        if(reg == 1){
            return "redirect:/index";
        }else{
            return "redirect:/becomeexpert";
        }
    }
}