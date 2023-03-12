package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pojo.Clothing;
import pojo.OrderItem;
import pojo.User;
import service.ClothingService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShoppingController {
    @Autowired
    ClothingService clothingService;
    @Autowired
    HttpSession session;

    @RequestMapping("shopping")
    public ModelAndView shopping() {
        ModelAndView mav = new ModelAndView();
        List<Clothing> cs = clothingService.list();
        // 放入转发参数
        mav.addObject("ps", cs);
        // 放入jsp路径
        mav.setViewName("shopping");
        return mav;
    }

    @RequestMapping("shoppingCart_jsp")
    public ModelAndView shoppingCart() {
        ModelAndView mav = new ModelAndView("shoppingCart");
        return mav;
    }

    @RequestMapping("shoppingCart")
    public ModelAndView shoppingCart(HttpServletResponse response, OrderItem orderItem) throws Exception {
        //判断是否登录
        User user = (User) session.getAttribute("loginUser");
        if (null == user) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('登录后才可使用');window.location='login_jsp'; </script>");
            return null;
        }
        //根据pid获取对应的商品信息
        Clothing clothing = clothingService.get(orderItem.getPid());
        orderItem.setClothing(clothing);
        //判断该商品购物车中是否存在
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        if (null == ois) {
            ois = new ArrayList<OrderItem>();
            session.setAttribute("ois", ois);
        }
        //总价
        Double count = (Double) session.getAttribute("count");
        if (null == count) {
            count = 0.0;
        }
        count+=clothing.getPrice()*orderItem.getNum();
        session.setAttribute("count", count);
        //总价
        boolean flag = false;
        for (OrderItem item : ois) {
            if (item.getClothing().getId() == orderItem.getClothing().getId()) {
                int num = item.getNum() + orderItem.getNum();
                item.setNum(num);
                if(num==0){
                    ois.remove(item);
                    ModelAndView mav = new ModelAndView("redirect:/shoppingCart_jsp");
                    return mav;
                }
                flag = true;
                break;
            }
        }
        if (!flag) {
            ois.add(orderItem);
        }

        ModelAndView mav = new ModelAndView("shoppingCart");
        return mav;
    }


    @ResponseBody
    @RequestMapping("shoppingCartAjax")
    public List shoppingCartAjax(HttpServletResponse response, OrderItem orderItem) throws Exception {
        //根据pid获取对应的商品信息
        Clothing clothing = clothingService.get(orderItem.getPid());
        orderItem.setClothing(clothing);
        //判断该商品购物车中是否存在
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        Double count = (double) session.getAttribute("count");
        double oisNum=0;
        for (OrderItem o : ois) {
            if (o.getClothing().getId() == orderItem.getClothing().getId()) {
                int num = o.getNum() + orderItem.getNum();
                o.setNum(num);
                count += clothing.getPrice() * orderItem.getNum();
                session.setAttribute("count", count);
                oisNum=o.getNum();
                if (num == 0) {
                    ois.remove(o);
                }
            }
        }
        List<Double> list=new  ArrayList<Double>();
        list.add(oisNum);
        list.add(count);
        list.add(clothing.getPrice()*oisNum);
        return list;
    }


}



















