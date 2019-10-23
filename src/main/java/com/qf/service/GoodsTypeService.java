package com.qf.service;

import com.qf.pojo.GoodsType;

import java.util.List;

public interface GoodsTypeService {
    List<GoodsType> selectAll();

    GoodsType getRecommendGoods(Integer typeId);

    List<GoodsType> getAllRecommendGoods();
}
