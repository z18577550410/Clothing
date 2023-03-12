package service;

import org.springframework.stereotype.Service;
import pojo.OrderItem;

import java.util.List;

@Service
public interface OrderItemService {
    int add(OrderItem orderItem);

    List<OrderItem> get(int oid);
}
