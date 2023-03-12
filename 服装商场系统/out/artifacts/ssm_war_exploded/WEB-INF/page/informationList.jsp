<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>Title</title>
    <link href="bootstrap/css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="bootstrap/js/bootstrap/3.3.6/bootstrap.js"></script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div style="margin: 20px auto;width: 80%">
    <h3 align="center">收货地址</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>收货人姓名</th>
            <th>收货地址</th>
            <th>手机号码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${informationList}" var="i">
            <tr>
                <td>${i.name}</td>
                <td>${i.shippingAddress}</td>
                <td>${i.mobilePhoneNumber}</td>
                <td>
                    <a href="getInformation?id=${i.id}" class="btn btn-success" role="button">选择</a>
                    <a href="informationDelete?id=${i.id}" class="btn btn-danger" role="button">删除</a>
                </td>
            </tr>
        </c:forEach>
        <form action="informationAdd" method="post">
            <tr>
                <td><input name="name" placeholder="请输入收货人姓名" required></td>
                <td><input name="shippingAddress" placeholder="请输入收货地址" required></td>
                <td><input name="mobilePhoneNumber" placeholder="请输入手机号码" required
                           onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                           onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "></td>
                <td>
                    <button type="submit" class="btn btn-success">添加</button>
                    <button type="reset" class="btn btn-success">重置</button>
                </td>
            </tr>
        </form>
        </tbody>
    </table>
</div>

</body>
</html>
