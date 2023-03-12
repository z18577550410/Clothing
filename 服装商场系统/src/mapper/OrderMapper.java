package mapper;

import pojo.Clothing;
import pojo.Order;

import java.util.List;

public interface OrderMapper {

    int add(Order order);

    List<Order> list();

    List<Order> get(int id);

    int update(int id );
}
