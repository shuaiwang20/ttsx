<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/register.js"></script>

<%--<ul class="subnav fl">--%>
    <c:forEach items="${goodsTypes}" var="goodsType">
        <li><a href="#model0${goodsType.id}" class="${goodsType.className}">${goodsType.title}</a></li>
    </c:forEach>
<%--    <li><a href="#model01" class="fruit">新鲜水果</a></li>--%>
<%--    <li><a href="#model02" class="seafood">海鲜水产</a></li>--%>
<%--    <li><a href="#model03" class="meet">猪牛羊肉</a></li>--%>
<%--    <li><a href="#model04" class="egg">禽类蛋品</a></li>--%>
<%--    <li><a href="#model05" class="vegetables">新鲜蔬菜</a></li>--%>
<%--    <li><a href="#model06" class="ice">速冻食品</a></li>--%>
<%--</ul>--%>
