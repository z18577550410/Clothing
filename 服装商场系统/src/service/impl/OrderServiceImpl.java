package service.impl;

import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Order;
import service.OrderService;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;


    @Override
    public int addOrder(Order order) {
        return orderMapper.add(order);
    }

    @Override
    public List<Order> list() {
        return orderMapper.list();
    }

    @Override
    public List<Order> get(int id) {
        return orderMapper.get(id);
    }

    @Override
    public int update(int id) {
        return orderMapper.update(id);
    }


}
