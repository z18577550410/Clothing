<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap5 实例</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="nav1.jsp"></jsp:include>
<div class="container mt-3">
    <h2>订单管理</h2>
    <p>当前用户的查看订单</p>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>收货人姓名</th>
            <th>收货地址</th>
            <th>手机号码</th>
            <th>下单时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orders}" var="o">
            <tr>
                <td>${o.information.name}</td>
                <td>${o.information.shippingAddress}</td>
                <td>${o.information.mobilePhoneNumber}</td>
                <td>${o.createDate}</td>
                <td>${o.state}</td>
                <td>
                    <a href="orderItemGet?id=${o.id}" class="btn btn-info" role="button">查看</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>