package com.qf.service;

import com.qf.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    User selectByUsernameAndPassword(String username,String password);
    void insertUser(User user);
    List<User> selectAllUser();
    User selectByUsernameOrEmail(String str);


}
