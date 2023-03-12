<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="bootstrap/css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="bootstrap/js/bootstrap/3.3.6/bootstrap.js"></script>

    <%--   layui的框架--%>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>

</head>
<body>
<%@include file="nav.jsp" %>
<div style="width: 1000px;margin:10px auto">
    <table class="table table-striped" style="width: 1000px ">
        <caption><h3 align="center">服装列表</h3>
            <a href="clothing_add" class="btn btn-success  btn-lg" role="button">添加服装</a>
            <a href="upload" class="btn btn-info  btn-lg" role="button">上传图片</a>
        </caption>
        <thead style="width: 1000px">
        <tr>
            <th>ID</th>
            <th>title</th>
            <th>subtitle</th>
            <th>color</th>
            <th>size</th>
            <th>price</th>
            <th>pic</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach items="${cs}" var="c" varStatus="st">
            <tr>
                <td>${c.id}</td>
                <td>${c.title}</td>
                <td>${c.subtitle}</td>
                <td>${c.color}</td>
                <td>${c.size}</td>
                <td>${c.price}</td>
                <td>${c.pic}</td>
                <td width="150">
                    <a href="clothing_edit?id=${c.id}" class="btn btn-success btn-sm" role="button">编辑</a>
                    <a href="clothing_delete?id=${c.id}" class="btn btn-danger btn-sm" role="button">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--分页--%>
<div style="text-align:center">
    <a href="?start=0" class="btn btn-default btn-lg" role="button">首 页</a>
    <%--上一页--%>
    <c:if test="${page.start-page.count<0}">
        <a href="?start=0" class="btn btn-default btn-lg" role="button">上一页</a>
    </c:if>
    <c:if test="${page.start-page.count>=0}">
        <a href="?start=${page.start-page.count}" class="btn btn-default btn-lg" role="button">上一页</a>
    </c:if>
    <%--下一页--%>
    <c:if test="${page.start+page.count > page.last}">
        <a href="?start=${page.last}" class="btn btn-default btn-lg" role="button">下一页</a>
    </c:if>
    <c:if test="${page.start+page.count <= page.last}">
        <a href="?start=${page.start+page.count}" class="btn btn-default btn-lg" role="button">下一页</a>
    </c:if>
    <a href="?start=${page.last}" class="btn btn-default btn-lg" role="button">末 页</a>
</div>


</body>
</html>
