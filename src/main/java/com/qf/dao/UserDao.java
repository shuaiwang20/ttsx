package com.qf.dao;

import com.qf.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User selectByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
    void insertUser(User user);
    List<User> selectAllUser();
    User selectUsernameOrEmail(@Param("str") String str);
}
