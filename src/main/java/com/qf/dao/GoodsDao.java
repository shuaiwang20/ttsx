package com.qf.dao;

import com.qf.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {
//    List<Goods> selectByTypeId(@Param("typeId") Integer id);
    void insert(Goods goods);

    Goods selectById(@Param("goodsId") Integer goodsId);

    List<Goods> selectByTypeId(@Param("typeId") Integer typeId,@Param("flag") String flag,@Param("abc")String abc);

    List<Goods> selectByTime();
}
