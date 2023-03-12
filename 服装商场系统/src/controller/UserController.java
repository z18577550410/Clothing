package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    HttpSession session;

    @RequestMapping("login_jsp")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping("login")
    public ModelAndView login(User user, HttpServletResponse response) throws Exception {
        User user1 = userService.login(user);
        if (null == user1) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('账号密码错误!');window.location='login_jsp'; </script>");
            return null;
        }
        session.setAttribute("loginUser", user1);
        ModelAndView mav = new ModelAndView("redirect:/shopping");
        return mav;
    }

    @RequestMapping("register_jsp")
    public ModelAndView register() throws Exception {
        ModelAndView mav = new ModelAndView("register");
        return mav;
    }

    @ResponseBody
    @RequestMapping( value = "registerAjax ", produces = "application/json; charset=utf-8" )
    public String registerAjax(String username) throws Exception {
        String a = "<p style='color: green' >会员名可用</p>";
        List<User> userList = userService.list();
        for (User user : userList) {
            if (user.getUsername().equals(username)) {
                a="<p style='color: red' >会员名已存在!</p>";
            }
        }
        return a;
    }



    @RequestMapping("register")
    public ModelAndView register(User user, HttpServletResponse response) throws Exception {
        userService.register(user);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('注册成功');window.location='login_jsp'; </script>");
        return null;
    }


    @RequestMapping("logout")
    public ModelAndView logout() {
        session.invalidate();
//        session.removeAttribute("loginUser");
//        session.removeAttribute("ois");
//        session.removeAttribute("count");
//        session.removeAttribute("information");
        ModelAndView mav = new ModelAndView("redirect:/shopping");

        return mav;

//        resp.setContentType("text/html;charset=utf-8");
//        resp.getWriter().write("<script>alert('您已退出登录!');window.location='shopping'; </script>");
    }


}
