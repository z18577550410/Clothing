<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="bootstrap/css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="bootstrap/js/bootstrap/3.3.6/bootstrap.js"></script>

</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div align="center">
    <%--    <c:if test="${!empty loginUser}">--%>
    <%--        当前用户:${loginUser.username}--%>
    <%--    </c:if>--%>
</div>
<div class="row" style="width: 100%">
    <c:forEach items="${ps}" var="p">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail" style="width: 350px;height: 680px">
                <img src="image/${p.pic}"
                     alt="通用的占位符缩略图" style="width: 340px;height: 480px ">
                <div class="caption">
                    <h3 style="text-align: center">${p.title}</h3>
                    <p style="text-align: center">${p.subtitle}</p>
                        <a href="#" class="btn btn-danger" role="button">价格: ${p.price}元</a>
                    <a href="shoppingCart?num=1&pid=${p.id}"
                       class="btn btn-success" role="button" style="margin-left: 80px">加入购物车</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
