package com.dhf.controller;

import com.dhf.domain.User1;
import com.dhf.domain.UserDetail;
import com.dhf.service.*;
import com.dhf.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user1")
public class User1Controller {

    @Autowired
    private User1Service user1Service;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private CityService cityService;
    @Autowired
    private GenreService genreService;
    @Autowired
    private CreateRequestService createRequestService;
    @Autowired
    private MyinformationService myinformationService;
    @RequestMapping(value = "/reg")
    public String reg(User1 user1, Model model) {
        int i = user1Service.checkReg(user1.getName1());
        //未被注册
        if (i == 0) {
            user1.setPwd(MD5.getMD5(user1.getPwd()));
            user1.setNickName(user1.getName1());
            user1.setTelephone(user1.getName1());
            Integer row = user1Service.reg(user1);
            //注册成功
            if(row != 0){
                model.addAttribute("msg","注册成功！");
                return "login";
            }
            //注册失败
            model.addAttribute("msg","注册失败，请重新注册！");
            return "reg";
        }
        //已经注册
        model.addAttribute("msg","该手机号已经注册！");
        return "reg";
    }

    @RequestMapping(value = "/login")
    public String login(User1 user1, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        user1.setPwd(MD5.getMD5(user1.getPwd()));
        User1 user = user1Service.checkLogin(user1);
        //不可以登录
        if (user == null) {
            return "redirect:/WEB-INF/views/login.jsp";
        }
        //可以登录
        request.getSession().setAttribute("login_user",user);
        return "redirect:/index";
    }

    @RequestMapping(value = "/logout")
    public void logout(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("/index").forward(request,response);
    }


    @RequestMapping(value = "/{userId}/update")
    /*对应方法中使用两个对象来接受参数，会报400错误（错误的请求），请求参数赋不到对象的属性上*/
    public String update(MultipartFile input1,@PathVariable Integer userId, HttpServletRequest request,HttpServletResponse response) throws IOException {

        String nickName = request.getParameter("nickName");//昵称
        String realName = request.getParameter("realName");//真实姓名
        String cardNo = request.getParameter("cardNo");//身份证号
        String birthday = request.getParameter("birthday");//生日
        Integer sex = Integer.parseInt(request.getParameter("sex"));//性别
        String email = request.getParameter("email");//邮箱
        String city = request.getParameter("city");//获取城市（市）
        String addressDesc = request.getParameter("addressDesc");//详细地址
        String descr = request.getParameter("descr");//自我评价

        //   获取文件名
        String fileName = input1.getOriginalFilename();

        //获取上传路径
        String uploadPath = request.getRealPath("/upload");
        File file = new File(uploadPath);
        //若上传路径不存在，新建路径
        if (!file.exists()) {
            file.mkdirs();
        }
        //上传文件最终的路径
        String newName = UUID.randomUUID() + fileName;
        String finalName = uploadPath + File.separator + newName;
        File finalFile = new File(finalName);
        //上传到指定路径
        input1.transferTo(finalFile);
        response.getWriter().println(request.getContextPath() + "/upload/" + newName);

        //1.先更改userinfo表head_url
        Object login_user = request.getSession().getAttribute("login_user");
        User1 userinfo = (User1) login_user;
        int id = userinfo.getId();
        User1 user1 = new User1();
        user1.setId(id);
        user1.setImage(newName);
        int i = user1Service.updateImageById(user1);
        //2.改下session
        userinfo.setImage(newName);
        request.getSession().setAttribute("login_user", userinfo);

        User1 user = new User1();
        user.setNickName(nickName);
        user.setSex(sex);
        user.setId(userId);

        UserDetail userDetail = new UserDetail();
        userDetail.setAddress(city);
        userDetail.setId(userId);
        userDetail.setRealName(realName);
        userDetail.setCardNo(cardNo);
        userDetail.setBirthday(birthday);
        userDetail.setEmail(email);
        userDetail.setAddressDesc(addressDesc);
        userDetail.setDescr(descr);
        Integer reg = myinformationService.updateUserMessage(user, userDetail);

        return "forward:/index";
    }

    @RequestMapping("/createRequest")
    public String createRequest(Model model,HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        if (request.getSession().getAttribute("login_user")!=null) {
            List<Map<String, Object>> provinces = provinceService.selectAllProvinces();
            List<Map<String, Object>> citys = cityService.selectAllCitys();
            model.addAttribute("provinces", provinces);
            model.addAttribute("citys", citys);

            return "createrequest";
        }else{
            return "login";
        }

    }

    @RequestMapping("/{userId}/createRequest")
    public String createRequest1(@PathVariable Integer userId, Model model,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");//预计完成时间
        Integer categoryId = Integer.parseInt(request.getParameter("example"));//技能
        String bonus = request.getParameter("bonus");//预算
        String maxbonus = request.getParameter("maxbonus");//最大预算
        String desc = request.getParameter("desc");//详细描述
        String address = request.getParameter("city");//发布地址（市）
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String nowDate = df.format(new Date());// new Date()为获取当前系统时间
        //获取category
        String category = genreService.selectGenreById(categoryId);
        Integer reg = createRequestService.InsertCreateRequestMessage(userId, date, categoryId, category, bonus, maxbonus, desc, address, nowDate);
        if (reg != 0){
            return  "redirect:/index";
        }else {
            return "/createRequest1";
        }
    }
    @RequestMapping("/{id}/receivetask")
    public String receiveTask(@PathVariable Integer id, HttpServletRequest request, HttpServletResponse response){
        User1 user1 = (User1) request.getSession().getAttribute("login_user");
        if (user1 !=null){
            Integer userId = user1.getId();
            Integer reg = user1Service.selectUserSkillExist(userId);
            if (reg != 0){
                user1Service.updateTaskWokerId(userId,id);
                return "redirect:/index";
            }else {
                return "becomeexport";
            }
        }else{
            return "login";
        }
    }
}
