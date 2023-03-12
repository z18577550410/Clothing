package mapper;

import pojo.Information;

import java.util.List;

public interface InformationMapper {

    List<Information> list();

    List<Information> get(int uid);

    Information getInformation(int id);

    int add(Information information);

    void  delete(int id);
}
