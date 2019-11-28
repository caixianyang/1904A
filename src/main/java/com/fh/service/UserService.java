package com.fh.service;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.model.Prop;
import com.fh.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {
    Long queryCount(ProductSearchParm productSearchParm);

    List queryMapUserList(ProductSearchParm productSearchParm);

    List<Prop> queryTypeList();

    void addUser(User user);

    void deleteUser(Integer id);

    void deleteBatch(List list);

    User getUserById(Integer id);

    void updateUser(User user);

    boolean getUserByName(String name);


    ServerResponse insertUser(User user, List<Integer> roleArr);

    void loginOut(HttpServletRequest request, HttpServletResponse response);

    ServerResponse login(User user, HttpServletRequest request, HttpServletResponse response);

    void refresh(HttpServletRequest request, HttpServletResponse response);

    ServerResponse codeForget(String phone, HttpServletRequest request);

    ServerResponse allBackPassWord(User user, String code, HttpServletRequest request);
}
