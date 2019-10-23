package com.qf;

import com.qf.pojo.User;
import com.qf.service.UserService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestService {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = context.getBean("userService", UserService.class);
        User user = userService.selectByUsernameAndPassword("张三", null);
        System.out.println(user.toString());
    }
}
