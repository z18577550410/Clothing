<%--   publicize.jsp   --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div >
    <img src="image/c.jpg" usemap="#11"  style="width:1400px" alt="">

    <map name="11" id="11">
        <area shape="rect" coords="430,430,680,510" href="shopping" alt="图形热区">
        <%--    coords="580,580,920,680"  --%>
        <!-- 热区的形状是rect矩形时，coords 左上角的x，y的值，右下角x，y的值 -->
        <%--  <area shape="circle" coords="550,450,150" href="04s.html">--%>
        <!-- 形状是圆形 circle时，coords 为圆心的x，y，半径大小 -->
    </map>
</div>
</body>
</html>
