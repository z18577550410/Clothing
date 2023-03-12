package service;


import org.springframework.stereotype.Service;
import pojo.Order;
import pojo.OrderItem;

import java.util.List;

@Service
public interface OrderService  {
    int addOrder(Order order);
    List<Order> list();

    List<Order> get(int id);

    int update(int id);



}
