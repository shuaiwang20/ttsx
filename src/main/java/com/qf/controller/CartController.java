package com.qf.controller;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {

    @RequiresAuthentication
    @PostMapping("/cart")
    public String addCart(){
        return "";
    }
    @GetMapping("/cart")
    public String getCart(){
        return "";
    }
}
