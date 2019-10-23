<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>

<%--<div class="list_model">--%>
    <div class="list_title clearfix">
        <h3 class="fl" id="model01">${goodsType.title}</h3>
        <div class="subtitle fl">
            <span>|</span>
            <c:forEach items="${goodsType.goodsList}" var="goods">
                <a href="#">${goods.title}</a>
            </c:forEach>
<%--            <a href="#">鲜芒</a>--%>
<%--            <a href="#">加州提子</a>--%>
<%--            <a href="#">亚马逊牛油果</a>--%>
        </div>
        <a href="${pageContext.request.contextPath}/goods/goodsByTypeId?typeId=${goodsType.id}" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/customer/images/${goodsType.banner_path}"></div>
        <ul class="goods_list fl">
            <c:forEach items="${goodsType.goodsList}" var="goods">
                <li>
                    <h4><a href="#">${goods.title}</a></h4>
                    <a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.id}"><img src="${pageContext.request.contextPath}/customer/images/goods/${goods.bannerPath}"></a>
                    <div class="prize">${goods.price}</div>
                </li>
            </c:forEach>
        </ul>
    </div>
<%--</div>--%>