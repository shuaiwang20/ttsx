package com.qf.dao;



import com.qf.pojo.GoodsType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsTypeDao {
    List<GoodsType> selectAll();

    GoodsType selectByTypeId(@Param("typeId") Integer typeId);

    List<GoodsType> selectAllInfo();
}
