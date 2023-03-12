package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pojo.Order;
import pojo.OrderItem;
import pojo.User;
import service.InformationService;
import service.OrderItemService;
import service.OrderService;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    InformationService informationService;
    @Autowired
    HttpSession session;

    @RequestMapping("orderCreate")
    public ModelAndView order(Order order,int iid) throws IOException {
        order.setUser((User) session.getAttribute("loginUser"));
        Date d =new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss ");
        String date = formatter.format(d);
        order.setCreateDate(date);
        order.setIid(iid);
        orderService.addOrder(order);

        session.setAttribute("oid",order.getId());
        ModelAndView mav = new ModelAndView("redirect:/orderItem");
        return mav;
    }

    @RequestMapping("orderManage")
    public ModelAndView orderManage() throws IOException {
        List<Order> orders= orderService.list();
        for (Order o:orders){
            o.setInformation(informationService.getInformation(o.getIid()));
        }
        ModelAndView mav = new ModelAndView("orderManage");
        mav.addObject("orders", orders);
        return mav;
    }

    @RequestMapping("orderGet")
    public ModelAndView orderGet() {
        User user = (User)session.getAttribute("loginUser");
        List<Order> orders= orderService.get(user.getId());
        for (Order o:orders){
            o.setInformation(informationService.getInformation(o.getIid()));
        }
        ModelAndView mav = new ModelAndView("orderGet");
        mav.addObject("orders", orders);
        return mav;
    }

    @RequestMapping("state")
    public ModelAndView state(int id) throws IOException {
        orderService.update(id);
        ModelAndView mav = new ModelAndView("redirect:/orderManage");
        return mav;
    }
}
























