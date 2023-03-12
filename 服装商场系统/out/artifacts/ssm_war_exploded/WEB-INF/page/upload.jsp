<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>图片上传.jpg</title>
    <%--   layui的框架--%>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>
<%@include file="nav.jsp" %>
<%--上传页面，需要注意的是form 的两个属性必须提供--%>
<%--method="post" 和 enctype="multipart/form-data" 缺一不可--%>
<%--上传组件 增加一个属性 accept="image/*" 表示只能选择图片进行上传--%>
<%--留意 <input type="file" name="image" accept="image/*" /> 这个image，后面会用到这个image--%>
<h1 style=" color: black; text-align: center;">上传图片</h1>
<div style="width: 500px; margin:30px auto">
    <form action="uploadImage" method="post" enctype="multipart/form-data">
        <div style="text-align: center">
            <p>请选择上传的图片：</p>
            <br>
            <input type="file" name="image" accept="image/*" style="margin-left: 160px">
            <br>
            <br>
            <button type="submit" class="layui-btn">上传图片</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
    <br>
    <img src="image/${imageName}">
</div>

</body>
</html>
