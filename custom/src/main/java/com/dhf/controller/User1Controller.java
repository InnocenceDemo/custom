package com.dhf.controller;

import com.dhf.domain.User1;
import com.dhf.domain.UserDetail;
import com.dhf.service.User1Service;
import com.dhf.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/user1")
public class User1Controller {

    @Autowired
    private User1Service user1Service;

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
    public void login(User1 user1, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        user1.setPwd(MD5.getMD5(user1.getPwd()));
        User1 user = user1Service.checkLogin(user1);
        //不可以登录
        if (user == null) {
            model.addAttribute("msg","用户名或者密码错误！");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
        }
        //可以登录
        model.addAttribute("msg",1);
        request.getSession().setAttribute("login_user",user);
        request.getRequestDispatcher("/index").forward(request,response);
    }

    @RequestMapping(value = "/logout")
    public void logout(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("/index").forward(request,response);
    }

    @RequestMapping(value = "/update")
    /*对应方法中使用两个对象来接受参数，会报400错误（错误的请求），请求参数赋不到对象的属性上*/
    public String update(User1 user1,
                         @RequestParam("realName") String realName,
                         @RequestParam("cardNo") String cardNo,
                         @RequestParam("birthday") Date birthday,
                         @RequestParam("email") String email,

                         @RequestParam("addressDesc") String addressDesc,
                         @RequestParam("descr") String descr,
                         HttpServletRequest request) {
        User1 user = (User1)request.getSession().getAttribute("login_user");
        user.setNickName(user1.getNickName());
        user.setSex(user1.getSex());
        UserDetail userDetail = new UserDetail();
        userDetail.setId(user.getId());
        userDetail.setRealName(realName);
        userDetail.setCardNo(cardNo);
        userDetail.setBirthday(birthday);
        userDetail.setEmail(email);
        //////////下拉框
//        userDetail.setAddress(province);
        userDetail.setAddressDesc(addressDesc);
        userDetail.setDescr(descr);
        return "index";
    }
}
