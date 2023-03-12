package service;

import org.springframework.stereotype.Service;
import pojo.Clothing;
import pojo.User;

import java.util.List;
@Service
public interface UserService {
    public User login(User user);

    int register(User user);

    List<User> list();
}
