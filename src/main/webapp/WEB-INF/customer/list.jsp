<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"/>
</head>
<body>

<jsp:include page="header.jsp"/>

<%--<div class="subnav_con fl">--%>
<%--    <h1>全部商品分类</h1>--%>
<%--    <span></span>--%>
<%--    <ul class="subnav" id="okk">--%>
<%--       <script>--%>
<%--           $("#okk").load("${pageContext.request.contextPath}/goodsType/allGoodsType")--%>
<%--       </script>--%>
<%--    </ul>--%>
<%--</div>--%>

<%--<div id="header">--%>
<%--&lt;%&ndash;    <span>你好</span>&ndash;%&gt;--%>
<%--    <script>--%>
<%--        $("#header").load("${pageContext.request.contextPath}/user/header");--%>

<%--    </script>--%>

<%--</div>--%>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul id="newgoods">
                <script>
                    $("#newgoods").load("${pageContext.request.contextPath}/goods/newGoods")
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
        <div class="sort_bar">
            <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}&flag=time" class="active">默认</a>
            <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}&flag=price&priceFlag=abc">价格</a>
            <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}">人气</a>
        </div>

        <ul class="goods_type_list clearfix">

        <c:forEach var="goods" items="${pageInfo.list}">
            <li>
                <a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.id}">
                    <img src="${pageContext.request.contextPath}/customer/images/goods/${goods.bannerPath}"></a>
                <h4><a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.id}">${goods.title}</a></h4>
                <div class="operate">
                    <span class="prize">￥${goods.price}</span>
                    <span class="unit">${goods.price}/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
        </c:forEach>

        </ul>


        <div class="pagenation">
            <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}&pageNum=${pageInfo.pageNum-1}&pageSize=10&flag=${flag}">上一页</a>
            <c:forEach begin="1" end="${pageInfo.pages}" var="i">
               <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}&pageNum=${i}&pageSize=10&flag=${flag}">${i}</a>
            </c:forEach>
            <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${typeId}&pageNum=${pageInfo.pageNum+1}&pageSize=10&flag=${flag}">下一页></a>
        </div>
    </div>
</div>

<div id="footer">
    <script>



        $("#footer").load("${pageContext.request.contextPath}/user/footer")
    </script>
</div>

</body>
</html>
