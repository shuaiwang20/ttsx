package com.qf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.dao.GoodsDao;
import com.qf.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;

    @Override
    public Goods selectById(Integer goodsId) {
        return goodsDao.selectById(goodsId);
    }

    @Override
    public PageInfo<Goods> selectByTypeId(Integer typeId, Integer pageNum, Integer pageSize,String flag,Integer priceFlag) {
        int a=priceFlag&1;
        PageHelper.startPage(pageNum,pageSize);
        String abc=null;
        if (a==1){
            //表示是奇数 提示降序  传一个非空值
            abc="abc";
        }
        List<Goods> goodsList = goodsDao.selectByTypeId(typeId,flag,abc);
        PageInfo<Goods> pageInfo=new PageInfo<>(goodsList);
        return pageInfo;
    }

    @Override
    public List<Goods> selectByTime() {
        return goodsDao.selectByTime();
    }
//    @Override
//    public List<Goods> getRecommendGoods(Integer id) {
//        return goodsDao.selectByTypeId(id);
//    }
}
