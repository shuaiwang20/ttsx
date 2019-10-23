<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-ui.min.js"/>

</head>
<body>

    <jsp:include page="header.jsp"/>
<%--<div id="header">--%>
<%--        <script>--%>
<%--            $("#header").load("${pageContext.request.contextPath}/user/header")--%>
<%--        </script>--%>
<%--    </div>--%>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
    <span>></span>
    <a href="#">商品详情</a>
</div>

<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/customer/images/${goods.imgPath}"></div>

    <div class="goods_detail_list fr">
        <h3>${goods.title}</h3>
        <p>草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。</p>
        <div class="prize_bar">
            <span class="show_pirze">¥<em>${goods.price}</em></span>
            <span class="show_unit">单  位：500g</span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：</div>
            <div class="num_add fl">
                <input id="num" type="text" class="num_show fl" value="1">
                <a href="javascript:;" class="add fr" id="plus">+</a>
                <a href="javascript:;" class="minus fr" id="sub">-</a>
            </div>
        </div>

        <div class="total">总价：<em><span id="total">${goods.price}</span></em></div>
        <div class="operate_btn">
            <a href="javascript:;" class="buy_btn">立即购买</a>
            <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
        </div>
    </div>
</div>



<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul id="aaa">
                <script>
                    $("#aaa").load("${pageContext.request.contextPath}/goods/newGoods")
                </script>
<%--                <li>--%>
<%--                    <a href="#"><img src="${pageContext.request.contextPath}/customer/images/goods/goods001.jpg"></a>--%>
<%--                    <h4><a href="#">进口柠檬</a></h4>--%>
<%--                    <div class="prize">￥3.90</div>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="#"><img src="${pageContext.request.contextPath}/customer/images/goods/goods002.jpg"></a>--%>
<%--                    <h4><a href="#">玫瑰香葡萄</a></h4>--%>
<%--                    <div class="prize">￥16.80</div>--%>
<%--                </li>--%>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active">商品介绍</li>
            <li>评论</li>
        </ul>

        <div class="tab_content">
            <dl>
                <dt>商品详情：</dt>
                <dd>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。 </dd>
            </dl>
        </div>

    </div>
</div>

<div id="footer">
    <script>
        $("#footer").load("${pageContext.request.contextPath}/user/footer")
    </script>
</div>
<%--<div class="footer">--%>
<%--    <div class="foot_link">--%>
<%--        <a href="#">关于我们</a>--%>
<%--        <span>|</span>--%>
<%--        <a href="#">联系我们</a>--%>
<%--        <span>|</span>--%>
<%--        <a href="#">招聘人才</a>--%>
<%--        <span>|</span>--%>
<%--        <a href="#">友情链接</a>--%>
<%--    </div>--%>
<%--    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>--%>
<%--    <p>电话：010-****888    京ICP备*******8号</p>--%>
<%--</div>--%>
<div class="add_jump"></div>

<script>
    $("#plus").click(function () {
        var n = $("#num").val();
        n=Number(n)+1
        $("#num").val(n)
        var price=${goods.price}*n
        price=price.toFixed(2);
        $("#total").html(price)
    })

    $("#sub").click(function () {
        var n = $("#num").val();
        if (n>=2){
            n=Number(n)-1
            $("#num").val(n)
            var price=${goods.price}*n
            price=price.toFixed(2);
            $("#total").html(price)
        }else{
            alert("客官不可以....")
        }
    })
</script>


<script type="text/javascript">
    var $add_x = $('#add_cart').offset().top;
    var $add_y = $('#add_cart').offset().left;

    var $to_x = $('#show_count').offset().top;
    var $to_y = $('#show_count').offset().left;

    $(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
    $('#add_cart').click(function(){
        $(".add_jump").stop().animate({
                'left': $to_y+7,
                'top': $to_x+7},
            "fast", function() {
                $(".add_jump").fadeOut('fast',function(){
                    $('#show_count').html(2);
                });

            });
    })
    <%--$("#header").load("${pageContext.request.contextPath}/user/header")--%>
</script>

</body>
</html>
