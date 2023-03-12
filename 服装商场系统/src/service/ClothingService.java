package service;

import org.springframework.stereotype.Service;
import pojo.Clothing;

import java.util.List;
@Service
public interface ClothingService {
    List<Clothing> list();
    int add(Clothing clothing);
    Clothing get(int id);

    void delete(int id);
    int update(Clothing clothing);
}
