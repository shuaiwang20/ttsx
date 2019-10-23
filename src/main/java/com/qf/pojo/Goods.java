package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer id;
    private String title;
    private String imgPath;
    private String bannerPath;
    private BigDecimal price;
    private String detail;
    private Integer typeId;
    private Date registerTime;
//    private GoodsType goodsType;
}
