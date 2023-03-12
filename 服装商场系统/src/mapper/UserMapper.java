package mapper;

import pojo.User;

import java.util.List;

public interface UserMapper {

    public  User login(User user);

    public int register(User user);

    List<User> list();


}
