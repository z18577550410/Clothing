package service.impl;

import mapper.InformationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Information;
import service.InformationService;

import java.util.List;
@Service

public class InformationServiceImpl implements InformationService {
    @Autowired
    InformationMapper informationMapper;

    @Override
    public List<Information> list() {
        return informationMapper.list();
    }

    @Override
    public List<Information> get(int uid) {
        return informationMapper.get(uid);
    }

    @Override
    public int add(Information information) {
        return informationMapper.add(information);
    }

    @Override
    public void delete(int id) {
        informationMapper.delete(id);
    }

    @Override
    public Information getInformation(int id) {
        return informationMapper.getInformation(id);
    }
}
