package com.qf;

import com.qf.dao.GoodsDao;
import com.qf.dao.UserDao;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsType;
import com.qf.pojo.User;
import com.qf.service.GoodsService;
import com.qf.service.GoodsTypeService;
import junit.framework.JUnit4TestAdapterCache;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.ContextLoader;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class TestDao {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDao userDao = context.getBean("userDao", UserDao.class);
//        userDao.insertUser(new User(null,"张三","123","237198@123.com",new Date(),"123"));
        System.out.println(userDao.toString());
//        User user = userDao.selectByUsernameAndPassword("zhangsan", null);
        List<User> users = userDao.selectAllUser();
        System.out.println(users.toString());
    }

    @Test
    public void test2(){

        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
         GoodsTypeService goodsTypeService = context.getBean("goodsTypeService", GoodsTypeService.class);
//        GoodsTypeService goodsTypeService = ContextLoader.getCurrentWebApplicationContext().getBean("goodsTypeService", GoodsTypeService.class);
        List<GoodsType> goodsTypes = goodsTypeService.selectAll();
        for (GoodsType goodsType : goodsTypes) {
            System.out.println(goodsType.toString());
        }
    }

    @Test
    public void test3(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsTypeService goodsTypeService = context.getBean("goodsTypeService", GoodsTypeService.class);
        GoodsType goodsType = goodsTypeService.getRecommendGoods(1);
        System.out.println(goodsType.toString());
    }
    @Test
    public void test4(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsTypeService goodsTypeService = context.getBean("goodsTypeService", GoodsTypeService.class);
        List<GoodsType> allRecommendGoods = goodsTypeService.getAllRecommendGoods();
        for (GoodsType allRecommendGood : allRecommendGoods) {
            System.out.println(allRecommendGood.toString());
        }
    }
//        private Integer id;
//    private String title;
//    private String imgPath;
//    private String bannerPath;
//    private BigDecimal price;
//    private String detail;
//    private Integer typeId;
//    private Date registerTime;
    @Test
    public void test5(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsDao goodsDao = context.getBean("goodsDao", GoodsDao.class);
        goodsDao.insert(new Goods(null,"基围虾","goods_detail.jpg","goods021.jpg",new BigDecimal("48.8"),"草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。"
        ,2,new Date()));
    }
    @Test
    public void test6(){
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsDao goodsDao = context.getBean("goodsDao", GoodsDao.class);
        Goods goods = goodsDao.selectById(1);
        System.out.println(goods.toString());
    }
}
