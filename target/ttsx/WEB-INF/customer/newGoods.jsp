<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
<c:forEach var="goods" items="${goodsList}">
    <li>
        <a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.id}"><img src="${pageContext.request.contextPath}/customer/images/goods/${goods.bannerPath}"></a>
        <h4><a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.id}">${goods.title}</a></h4>
        <div class="prize">${goods.price}</div>
    </li>
</c:forEach>

