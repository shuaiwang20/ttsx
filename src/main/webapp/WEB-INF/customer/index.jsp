<%@page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/slide.js"></script>
</head>
<body>

<div id="header">
    <script type="text/javascript">
        $("#header").load("${pageContext.request.contextPath}/user/header");
    </script>
</div>
<div class="center_con clearfix" >

    <ul class="subnav fl" id="goodsType">

        <script type="text/javascript">
              $("#goodsType").load("${pageContext.request.contextPath}/goodsType/allGoodsType")
        </script>
    </ul>
    <div class="slide fl">
        <ul class="slide_pics">
            <li><img src="${pageContext.request.contextPath}/customer/images/slide.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/customer/images/slide02.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/customer/images/slide03.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/customer/images/slide04.jpg" alt="幻灯片"></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>

    <div class="adv fl">
        <a href="#"><img src="${pageContext.request.contextPath}/customer/images/adv01.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/customer/images/adv02.jpg"></a>
    </div>
</div>

<div class="list_model" id="recommend">
    <script type="text/javascript">
        $("#recommend").load("${pageContext.request.contextPath}/goodsType/recommend?typeId=1")
    </script>
</div>


<div class="list_model" id="recommend1">
    <script type="text/javascript">
        $("#recommend1").load("${pageContext.request.contextPath}/goodsType/recommend?typeId=2")
    </script>
</div>


<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model03">猪牛羊肉</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="list.html" class="goods_more fr">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/customer/images/banner03.jpg"></div>
        <ul class="goods_list fl">
            <li>
                <h4><a href="#">维多利亚葡萄维多利亚葡萄维多利亚葡萄维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
        </ul>
    </div>
</div>

<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model04">禽类蛋品</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="list.html" class="goods_more fr">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/customer/images/banner04.jpg"></div>
        <ul class="goods_list fl">
            <li>
                <h4><a href="#">维多利亚葡萄维多利亚葡萄维多利亚葡萄维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
        </ul>
    </div>
</div>

<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model05">新鲜蔬菜</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="list.html" class="goods_more fr">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/customer/images/banner05.jpg"></div>
        <ul class="goods_list fl">
            <li>
                <h4><a href="#">维多利亚葡萄维多利亚葡萄维多利亚葡萄维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
        </ul>
    </div>
</div>

<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model06">速冻食品</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="list.html" class="goods_more fr">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/customer/images/banner06.jpg"></div>
        <ul class="goods_list fl">
            <li>
                <h4><a href="#">维多利亚葡萄维多利亚葡萄维多利亚葡萄维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
            <li>
                <h4><a href="#">维多利亚葡萄</a></h4>
                <a href="detail.html"><img src="${pageContext.request.contextPath}/customer/images/goods.jpg"></a>
                <div class="prize">¥ 38.00</div>
            </li>
        </ul>
    </div>
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
<div id="footer">
    <script >
        $("#footer").load("${pageContext.request.contextPath}/user/footer")
    </script>
</div>
<script type="text/javascript">
    BCSlideshow('focuspic');
    var oFruit = document.getElementById('fruit_more');
    var oShownum = document.getElementById('show_count');

    var hasorder = localStorage.getItem('order_finish');

    if(hasorder)
    {
        oShownum.innerHTML = '2';
    }

    oFruit.onclick = function(){
        window.location.href = 'list.html';
    }
</script>
</body>
</html>
