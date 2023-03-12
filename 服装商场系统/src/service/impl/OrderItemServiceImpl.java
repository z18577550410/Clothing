package service.impl;

import mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.OrderItem;
import service.OrderItemService;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderItemMapper orderItemMapper;
    @Override
    public int add(OrderItem orderItem) {
        return orderItemMapper.add(orderItem);
    }

    @Override
    public List<OrderItem> get(int oid) {
        return orderItemMapper.get(oid);
    }
}
