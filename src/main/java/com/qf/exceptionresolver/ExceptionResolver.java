package com.qf.exceptionresolver;

import com.alibaba.fastjson.JSON;
import com.qf.utils.R;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        System.out.println(ex.toString());
        ex.printStackTrace();
        ModelAndView modelAndView=new ModelAndView();
        if (ex instanceof UnknownAccountException || ex instanceof IncorrectCredentialsException){
//            modelAndView.setViewName("redirect:/user/register");
//            response.setContentType("application/plain;charset=utf-8");
            try {
                R r = R.error("用户名或密码错误");

                response.getWriter().print(JSON.toJSON(r));
                response.getWriter().flush();
                response.getWriter().close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        else if (){
//
//        }
        return null;
    }
}
