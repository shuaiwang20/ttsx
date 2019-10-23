package com.qf.service;



import com.qf.dao.GoodsTypeDao;
import com.qf.pojo.GoodsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeDao goodsTypeDao;
    @Override
    public List<GoodsType> selectAll() {
        return goodsTypeDao.selectAll();
    }

    @Override
    public GoodsType getRecommendGoods(Integer typeId) {
        GoodsType goodsType=goodsTypeDao.selectByTypeId(typeId);
        return goodsType;
    }

    @Override
    public List<GoodsType> getAllRecommendGoods() {
        return goodsTypeDao.selectAllInfo();
    }
}
