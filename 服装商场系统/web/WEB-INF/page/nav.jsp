<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<c:if test="${order!=null}">--%>
<%--    <script>--%>
<%--        alert("${order}")--%>
<%--    </script>--%>
<%--</c:if>--%>
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
<style>
    .navbar {
        background: #343a40 !important
    }

    li {
        margin: 5px;
        font-size: 16px;
    }

    nav {
        height: 60px;
    }
</style>
<nav class="navbar navbar-default  " role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="margin:5px;font-weight: bold; color: white">IKUN</a>
        </div>
        <ul class="nav navbar-nav">
            <%--    管理员        --%>
            <c:if test="${sessionScope.loginUser.role == '管理员'}">
                <li><a href="clothing_list"><span style="color: #ffc107; font-weight: bold"> 服装管理</span></a></li>
                <li><a href="orderManage"><span style="color:#ffc107; font-weight: bold">订单管理</span></a>
                </li>
                <li><a href="shopping"><span style="color:#67b168; font-weight: bold"> 商品列表</span></a>
                <li><a href="shoppingCart_jsp"><span style="color:#67b168; font-weight: bold">我的购物车</span></a>
                <li><a href="orderGet"><span
                        style="color:#67b168; font-weight: bold">订单详情</span></a>
                </li>
            </c:if>


            <%-- 会员--%>
            <c:if test="${sessionScope.loginUser.role == '会员'}">
            <li><a href="shopping"><span style="color:#67b168; font-weight: bold"> 商品列表</span></a>
            <li><a href="shoppingCart_jsp"><span style="color:#67b168; font-weight: bold">我的购物车</span></a>
            <li><a href="orderGet"><span style="color:#67b168; font-weight: bold">订单详情</span></a>
                </c:if>

                <%-- 未登陆 --%>
                <c:if test="${sessionScope.loginUser.role == null}">
            <li><a href="shopping"><span style="color:#67b168; font-weight: bold"> 商品列表</span></a>
            <li><a href="shoppingCart_jsp"><span style="color:#67b168; font-weight: bold">我的购物车</span></a>
                </c:if>


        </ul>


        <ul class="nav navbar-nav navbar-right">
            <c:if test="${sessionScope.loginUser.role == '会员'}">
                <li>
                    <a href="#">
                <span class="glyphicon glyphicon-user">
                ${sessionScope.loginUser.username}-${sessionScope.loginUser.role}
                </span>
                    </a>
                </li>
                <li><a href="logout"><span style="color:#67b168; font-weight: bold">退出</span></a>
                </li>
            </c:if>

            <c:if test="${sessionScope.loginUser.role == '管理员'}">
                <li>
                    <a href="#">
                <span class="glyphicon glyphicon-user">
                ${sessionScope.loginUser.username}-${sessionScope.loginUser.role}
                </span>
                    </a>
                </li>
                <li><a href="logout"><span style="color:#67b168; font-weight: bold">退出</span></a>
                </li>
            </c:if>

            <c:if test="${sessionScope.loginUser.role == null}">
                <li><a href="login_jsp"><span style="color:#67b168; font-weight: bold">登录</span></a>
                <li><a href="register_jsp"><span style="color:#67b168; font-weight: bold">注册</span></a>
                </li>
            </c:if>
        </ul>


    </div>
</nav>


</body>
</html>