package service;

import org.springframework.stereotype.Service;
import pojo.Information;

import java.util.List;

@Service
public interface InformationService {
    List<Information> list();

    List<Information> get(int uid);

    int add(Information information);

    void  delete(int id);

    Information getInformation(int id);

}
