package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsType {
    private Integer id;
    private String title;
    private String className;
    private String banner_path;
    private Date createTime;
    private List<Goods> goodsList;
}
