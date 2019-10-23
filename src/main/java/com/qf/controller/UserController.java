package com.qf.controller;

import com.qf.pojo.Status;
import com.qf.pojo.User;
import com.qf.service.UserService;
import com.qf.utils.R;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/checkUsername")
    public void checkUsername(String username, HttpServletResponse response) throws IOException {
        System.out.println("开始验证用户名---"+username);
        User user = userService.selectByUsernameAndPassword(username, null);
        if (user==null){
            response.getWriter().write("1");
            return ;
        }
        response.getWriter().write("0");
    }

    @RequestMapping("/checkEmail")
    public void checkEmail(String email, HttpServletResponse response) throws IOException {
        System.out.println("开始验证邮箱---"+email);
//        User user = userService.selectByUsernameAndPassword(username, null);
        User user = userService.selectByUsernameOrEmail(email);
        if (user==null){
            response.getWriter().write("1");
            return ;
        }
        response.getWriter().write("0");
    }
//    @ResponseBody
    @RequestMapping("/checkVcode")
    public void checkVcode(String vcode, HttpSession session,HttpServletResponse response) throws IOException {
        System.out.println("验证验证码");
        System.out.println(vcode);
        String captcha = (String) session.getAttribute("captcha");
        if (vcode!=null&&captcha.equalsIgnoreCase(vcode)){
            //正确
//            return new Status("ok");
            response.getWriter().write("1");
        }else {
            //        return new Status("error");
            response.getWriter().write("0");
        }

    }

    /*去注册   实现shiro*/
    @GetMapping("/register")
    public String registerLogic(HttpServletRequest request){
//        Cookie[] cookies = request.getCookies();
//        if (cookies!=null){
//            for (Cookie cookie : cookies) {
//                /*如果有cookie转发*/
//                if (cookie.getName().equalsIgnoreCase("rememberMeCookie")){
//
//                }
//            }
//        }


        return "forward:/WEB-INF/customer/register.jsp";
    }
    /*注册实现*/
    @PostMapping("/register")
    public void register(@RequestBody User user, HttpServletResponse response) throws IOException {
        System.out.println(user.toString());
        /*已存在*/
        User user1 = userService.selectByUsernameAndPassword(user.getUsername(), null);
        if (user1!=null){
            response.getWriter().write("0");
        }
        /*不存在*/
        System.out.println("11111111");
        userService.insertUser(user);
        response.getWriter().write("1");
    }


/*去登陆*/
    @GetMapping("/login")
    public String toLogin(String msg,HttpServletRequest request){
        request.setAttribute("msg",msg);
        return "forward:/WEB-INF/customer/login.jsp";
    }

/*登录实现*/
    @ResponseBody
    @PostMapping("/login")
    public R loginLogic(User user, String auto, HttpServletResponse response) throws IOException {
        System.out.println(auto);
        System.out.println(user.toString());
        /*通过用户名或邮箱确定用户名 实现用户名或邮箱登录 */
        User user1 = userService.selectByUsernameOrEmail(user.getUsername());
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token=null;
        if (user1==null){
            return new R(0,"用户名或密码错误");
        }
        //如果用户名或邮箱正确
        token=new UsernamePasswordToken(user1.getUsername(),user.getPassword());
        if (auto!=null&&auto!=""){
            token.setRememberMe(true);
        }
        subject.login(token);
        return new R(1,"登陆成功");
    }

    @GetMapping("/index")
    public String toIndex(){
        return "forward:/WEB-INF/customer/index.jsp";
    }

    @RequestMapping("/header")
    public String header(){
        return "forward:/WEB-INF/customer/header.jsp";
    }

    @RequestMapping("/footer")
    public String footer(){
        return "forward:/WEB-INF/customer/footer.jsp";
    }

    @RequestMapping("/logOut")
    public String logOut(){
        SecurityUtils.getSubject().logout();
        return "forward:/user/login";
    }
}
