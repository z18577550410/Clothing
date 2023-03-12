package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Order;
import pojo.OrderItem;
import pojo.User;
import service.ClothingService;
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
public class OrderItemController {
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ClothingService clothingService;
    @Autowired
    HttpSession session;

    @RequestMapping("orderItem")
    public ModelAndView orderItem(HttpServletResponse response) throws IOException {
        int oid = (int) session.getAttribute("oid");
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        for (OrderItem o : ois) {
            o.setOid(oid);
            orderItemService.add(o);
        }
        session.removeAttribute("ois");
        session.removeAttribute("count");
        session.removeAttribute("oid");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('下单成功!');window.location='shoppingCart_jsp'; </script>");
        return null;
    }

    @RequestMapping("orderItemGet")
    public ModelAndView orderItemGet(int id) {
        List<OrderItem> orderItems =orderItemService.get(id);
        for (OrderItem o:orderItems){
            o.setClothing(clothingService.get(o.getPid()));
        }
        ModelAndView mav = new ModelAndView("orderDetails");
        mav.addObject("orderItems", orderItems);
        return mav;
    }

}
