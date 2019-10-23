package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsType;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/detail")
    private String goodsDetail(Integer goodsId,HttpServletRequest request){
        System.out.println(goodsId);
        Goods goods=goodsService.selectById(goodsId);
        System.out.println(goods.toString());
        request.setAttribute("goods",goods);
        return "forward:/WEB-INF/customer/detail.jsp";
    }

    @RequestMapping("/goodsByTypeId")
    private String goodsByType(Integer typeId,String pageNum,String pageSize,HttpServletRequest request,String flag,String priceFlag){
        int pn=1;
        int ps=10;
        if (pageNum!=null&&pageNum!=""){
            pn=Integer.parseInt(pageNum);
        }
        if (pageSize!=null&&pageSize!=""){
            ps=Integer.parseInt(pageSize);
        }
        HttpSession session = request.getSession();
        Integer priceFlag1 = (Integer) session.getAttribute("priceFlag");
        //默认1则降序，f0则升序,默认为0
        if (priceFlag1==null){
            //表示session中不存在则创建
            session.setAttribute("priceFlag",0);
        }
        System.out.println("priceFlag1=="+priceFlag1);
        if (priceFlag!=null){
            priceFlag1++;
            session.setAttribute("priceFlag",priceFlag1);
        }
        PageInfo<Goods> pageInfo = goodsService.selectByTypeId(typeId, pn, ps,flag,priceFlag1);
        request.setAttribute("flag",flag);
        request.setAttribute("typeId",typeId);
        request.setAttribute("pageInfo",pageInfo);
        return "forward:/WEB-INF/customer/list.jsp";
    }

    @RequestMapping("/newGoods")
    public String newGoods(HttpServletRequest request){
        List<Goods> goodsList=goodsService.selectByTime();
        request.setAttribute("goodsList",goodsList);
        return "forward:/WEB-INF/customer/newGoods.jsp";
    }
}
