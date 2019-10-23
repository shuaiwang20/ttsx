package com.qf.service;

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
//    @Override
//    public List<Goods> getRecommendGoods(Integer id) {
//        return goodsDao.selectByTypeId(id);
//    }
}
