package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Clothing;
import pojo.Information;
import pojo.Order;
import pojo.User;
import service.InformationService;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class InformationController {
    @Autowired
    InformationService informationService;
    @Autowired
    HttpSession session;

    @RequestMapping("informationList")
    public ModelAndView informationList() throws IOException {
        List<Information> informationList= informationService.list();
        ModelAndView mav = new ModelAndView("informationList");
        mav.addObject("informationList", informationList);
        return mav;
    }

    @RequestMapping("informationGet")
    public ModelAndView informationGet() throws IOException {
        User user=(User) session.getAttribute("loginUser");
        int uid =user.getId();
        List<Information> informationList= informationService.get(uid);
        ModelAndView mav = new ModelAndView("informationList");
        mav.addObject("informationList", informationList);
        return mav;
    }

    @RequestMapping("informationAdd")
    public ModelAndView informationAdd(Information information) {
        User user=(User) session.getAttribute("loginUser");
        information.setUid(user.getId());
        informationService.add(information);
        ModelAndView mav = new ModelAndView("redirect:/informationGet");
        return mav;
    }

    @RequestMapping("informationDelete")
    public ModelAndView informationDelete(int id,HttpSession session) throws Exception {
        informationService.delete(id);
        session.removeAttribute("information");
        ModelAndView mav = new ModelAndView("redirect:/informationGet");
        return mav;
    }

    @RequestMapping("getInformation")
    public ModelAndView getInformation(int id) throws IOException {
        Information information=informationService.getInformation(id);
        session.setAttribute("information",information);
        ModelAndView mav = new ModelAndView("redirect:/shoppingCart_jsp");
        return mav;
    }

}
