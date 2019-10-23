package com.qf.controller;

import com.qf.pojo.Goods;
import com.qf.pojo.GoodsType;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

}
