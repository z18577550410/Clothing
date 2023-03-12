package mapper;

import pojo.Clothing;

import java.util.List;

public interface ClothingMapper {
    List<Clothing> list();

    int add(Clothing clothing);

    void delete(int id);

    int update(Clothing clothing);

    Clothing get(int id);
}
