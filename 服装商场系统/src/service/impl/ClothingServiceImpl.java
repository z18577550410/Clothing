package service.impl;

import mapper.ClothingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Clothing;
import service.ClothingService;

import java.util.List;
@Service
public class ClothingServiceImpl implements ClothingService {
    @Autowired
    ClothingMapper clothingMapper;

    @Override
    public List<Clothing> list() {
        return clothingMapper.list();
    }

    @Override
    public int add(Clothing clothing) {
        return clothingMapper.add(clothing);

    }

    @Override
    public Clothing get(int id) {
        return clothingMapper.get(id);
    }

    @Override
    public void delete(int id) {
        clothingMapper.delete(id);
    }

    @Override
    public int update(Clothing clothing) {
        return clothingMapper.update(clothing);
    }


}
