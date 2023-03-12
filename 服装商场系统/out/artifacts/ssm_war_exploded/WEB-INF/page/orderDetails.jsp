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
<%--管理员--%>
<jsp:include page="nav1.jsp"></jsp:include>
<div class="container mt-3">
    <h2>订单详情</h2>
    <p>订单详情，购买的商品和数量</p>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>商品描述</th>
            <th>颜色</th>
            <th>尺寸</th>
            <th>商品价格</th>
            <th>数量</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${orderItems}" var="o"  >
            <tr>
                <td>${o.pid}</td>
                <td>${o.clothing.title}</td>
                <td>${o.clothing.subtitle}</td>
                <td>${o.clothing.color}</td>
                <td>${o.clothing.size}</td>
                <td>${o.clothing.price}</td>
                <td>${o.num}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>