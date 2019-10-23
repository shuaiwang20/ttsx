package com.qf.service;

import com.github.pagehelper.PageInfo;
import com.qf.pojo.Goods;

import java.util.List;

public interface GoodsService {
    Goods selectById(Integer goodsId);

    PageInfo<Goods> selectByTypeId(Integer typeId, Integer pageNum, Integer pageSize,String flag,Integer priceFlag);

    List<Goods> selectByTime();
//    List<Goods> getRecommendGoods(Integer id);
}
