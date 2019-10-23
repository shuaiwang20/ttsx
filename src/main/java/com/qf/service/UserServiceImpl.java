package com.qf.service;

import com.qf.dao.UserDao;
import com.qf.pojo.User;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User selectByUsernameAndPassword(String username, String password) {
        User user = userDao.selectByUsernameAndPassword(username, password);
        return user;
    }

    @Override
    public void insertUser(User user) {
        String salt = UUID.randomUUID().toString();
        String pwd = new Sha256Hash(user.getPassword(), salt, 10000).toBase64();
        user.setRegisterTime(new Date());
        user.setSalt(salt);
        user.setPassword(pwd);
        userDao.insertUser(user);
    }

    @Override
    public List<User> selectAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public User selectByUsernameOrEmail(String str) {
        User user=userDao.selectUsernameOrEmail(str);
        return user;
    }
}
