package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.model.Prop;
import com.fh.model.User;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    Long queryCount(ProductSearchParm productSearchParm);

    List queryMapUserList(ProductSearchParm productSearchParm);

    List<Prop> queryTypeList();

    void addUser(User user);

    void deleteUser(Integer id);

    void deleteBatch(List list);

    User getUserById(Integer id);

    void updateUser(User user);

    User getUserByName(String name);

}
