package mapper;

import pojo.Order;
import pojo.OrderItem;

import java.util.List;

public interface OrderItemMapper {
    int add(OrderItem orderItem);

    List<OrderItem> get(int oid);
}
