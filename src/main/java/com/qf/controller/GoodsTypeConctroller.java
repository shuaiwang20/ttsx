package com.qf.controller;



import com.qf.pojo.Goods;
import com.qf.pojo.GoodsType;
import com.qf.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/goodsType")
@Controller
public class GoodsTypeConctroller {
    @Autowired
    private GoodsTypeService goodsTypeService;
    @RequestMapping("/allGoodsType")
    public String allGoodsType(HttpServletRequest request){
        List<GoodsType> goodsTypes = goodsTypeService.selectAll();
        request.setAttribute("goodsTypes",goodsTypes);
        return "forward:/WEB-INF/customer/goodsType.jsp";
    }

    @RequestMapping("/recommend")
    public String recommendGoods(HttpServletRequest request,String typeId){
       GoodsType goodsType= goodsTypeService.getRecommendGoods(Integer.parseInt(typeId));
        request.setAttribute("goodsType",goodsType);
        return "forward:/WEB-INF/customer/recommend_good.jsp";
    }

//    @RequestMapping("/recommend")
//    public String recommendGoods2(){
//        List<GoodsType> goodsTypeList=goodsTypeService.getAllRecommendGoods();
//        return "forward:/WEB-INF/customer/recommend_good.jsp";
//    }
}
