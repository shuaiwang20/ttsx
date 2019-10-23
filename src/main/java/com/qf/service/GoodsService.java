package com.qf.service;

import com.qf.pojo.Goods;

import java.util.List;

public interface GoodsService {
    Goods selectById(Integer goodsId);
//    List<Goods> getRecommendGoods(Integer id);
}
