<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap 实例</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
    li {
        margin-right: 20px;
    }

</style>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <ul class="navbar-nav ">
            <li class="nav-item">
                <a class="navbar-brand" href="#" style="margin-right: 1px;font-weight: bold;">IKUN</a>
            </li>
            <c:if test="${sessionScope.loginUser.role == '管理员'}">
                <li class="nav-item">
                    <a class="nav-link text-warning" href="clothing_list">服装管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="orderManage">订单管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shopping">商品列表</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shoppingCart_jsp">购物车</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="orderGet">订单详情</a>
                </li>
            </c:if>

            <c:if test="${sessionScope.loginUser.role == '会员'}">
                <li class="nav-item">
                    <a class="nav-link" href="shopping">商品列表</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shoppingCart_jsp">购物车</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="orderGet">订单详情</a>
                </li>
            </c:if>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item" style="justify-content: right">
                <a class="nav-link" href="#">${sessionScope.loginUser.username}-${sessionScope.loginUser.role}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">退出</a>
            </li>
        </ul>
    </div>
</nav>

<%--<div class="container-fluid">--%>
<%--    <h3>品牌/Logo</h3>--%>
<%--    <p>.navbar-brand 类用于高亮显示品牌/Logo:</p>--%>
<%--</div>--%>

</body>
</html>