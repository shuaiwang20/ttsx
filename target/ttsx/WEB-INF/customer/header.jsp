<%--
  Created by IntelliJ IDEA.
  User: shuaiwang20
  Date: 2019/10/23
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/slide.js"></script>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="fr">
            <div class="login_info fl">
                欢迎您：<em><shiro:user><shiro:principal/></shiro:user></em>
            </div>
            <div class="login_btn fl">
                <a href="${pageContext.request.contextPath}/user/login">登录</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/user/register">注册</a>
            </div>
            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.html">用户中心</a>
                <span>|</span>
                <a href="cart.html">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.html">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/user/index" class="logo fl">
        <img src="${pageContext.request.contextPath}/customer/images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="#" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">1</div>
    </div>
</div>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav" id="ok">
               <script>
                   $("#ok").load("${pageContext.request.contextPath}/goodsType/allGoodsType");
               </script>
            </ul>
        </div>
        <ul class="navlist fl">
            <li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>
<%--<div class="navbar_con">--%>
<%--    <div class="navbar">--%>
<%--        <h1 class="fl">全部商品分类</h1>--%>
<%--        <ul class="navlist fl">--%>
<%--            <li><a href="">首页</a></li>--%>
<%--            <li class="interval">|</li>--%>
<%--            <li><a href="">手机生鲜</a></li>--%>
<%--            <li class="interval">|</li>--%>
<%--            <li><a href="">抽奖</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
