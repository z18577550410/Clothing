<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<h1 style=" color: black; text-align: center;">修改</h1>
<div style="width: 500px; margin:10px auto">
    <%--    表单--%>
    <form class="layui-form" action="clothing_update" method="post">
        <%--  id隐藏      --%>
        <input name="id" value="${c.id}" hidden>


        <%--11111 --%>
        <div class="layui-form-item">
            <label class="layui-form-label">title</label>
            <div class="layui-input-block">
                <input type="text" value="${c.title}" name="title" required lay-verify="required"
                       placeholder="请输入title" autocomplete="off" class="layui-input">
            </div>
        </div>


        <%--            2--%>
        <div class="layui-form-item">
            <label class="layui-form-label">subtitle</label>
            <div class="layui-input-block">
                <input type="text" name="subtitle" required lay-verify="required" placeholder="请输入subtitle"
                       value="${c.subtitle}" autocomplete="off" class="layui-input">
            </div>
        </div>


        <%--            3--%>
        <div class="layui-form-item">
            <label class="layui-form-label">color</label>
            <div class="layui-input-block">
                <input type="text" name="color" required lay-verify="required" placeholder="请输入color"
                       value="${c.color}" autocomplete="off" class="layui-input">
            </div>
            <br>
        </div>


        <%--4--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">size</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" value="${c.size}" name="size" required lay-verify="required"--%>
<%--                       placeholder="请输入size" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">size</label>
            <div class="layui-input-block">
                <select name="size" required>
                    <option value="${c.size}">${c.size}</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
                </select>
            </div>
        </div>


        <%--   5--%>
        <div class="layui-form-item">
            <label class="layui-form-label">price</label>
            <div class="layui-input-block">
                <%--                <input type="text" name="price" required lay-verify="required" placeholder="请输入price"--%>
                <%--                       value="${c.price}" autocomplete="off" class="layui-input">--%>
                <input onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"
                       name="price" placeholder="请输入price,只能输入数字" value="${c.price}" class="layui-input">
            </div>
        </div>


        <%--       6--%>
        <div class="layui-form-item">
            <label class="layui-form-label">pic</label>
            <div class="layui-input-block">
                <input type="text" name="" required lay-verify="required" placeholder="原文件名"
                       value="${c.pic}" autocomplete="off" class="layui-input">
                <input type="file" name="pic" required lay-verify="required" placeholder="pic"
                       value="" class="">
            </div>
        </div>


        <%--      按钮      --%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn">修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <%--    <div class="layui-input-block">--%>
    <%--        <form action="upload2" method="post" enctype="multipart/form-data">--%>
    <%--            <input type="submit" value="上传图片" class="layui-btn"><br><br>--%>
    <%--            <input type="file" name="filepath"><br>--%>
    <%--        </form>--%>
    <%--    </div>--%>
</div>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>


</body>
