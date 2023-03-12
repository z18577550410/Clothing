<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>Title</title>
    <link href="bootstrap/css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
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
        <tr>
            <td>${sessionScope.information.name}</td>
            <td>${sessionScope.information.shippingAddress}</td>
            <td>${sessionScope.information.mobilePhoneNumber}</td>
            <c:if test="${!empty information}">
                <td><a href="informationGet" class="btn btn-success" role="button">切换</a></td>
            </c:if>
            <c:if test="${empty information}">
                <td></td>
            </c:if>
        </tr>
        </tbody>
    </table>

    <h3 align="center">我的购物车</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>商品描述</th>
            <th>颜色</th>
            <th>尺寸</th>
            <th>商品单价</th>
            <th>商品数量</th>
            <th>商品小计</th>
        </tr>
        </thead>
        <tbody id="tBody">
        <c:forEach items="${ois}" var="o">
            <tr>
                <td>${o.clothing.id}</td>
                <td>${o.clothing.title}</td>
                <td>${o.clothing.subtitle}</td>
                <td>${o.clothing.color}</td>
                <td>${o.clothing.size}</td>
                <td>${o.clothing.price}</td>
                <td>
                    <button name="add" buttonID="${o.clothing.id}" class="btn btn-danger btn-sm"
                            style="margin-right:10px">+
                    </button>
                    <span id="num+${o.clothing.id}"> ${o.num}</span>
                    <button name="minus" buttonID="${o.clothing.id}" class="btn btn-danger btn-sm"
                            style="margin-left:10px">-
                    </button>
                </td>
                <td><span id="clothing+${o.clothing.id}">
                    <fmt:formatNumber type="number" value="${o.clothing.price*o.num}" pattern="0.00"
                                      maxFractionDigits="2"/></span></td>
                </span>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="right">
                总价:<span id="count"><fmt:formatNumber type="number" value="${count}" pattern="0.00"
                                                        maxFractionDigits="2"/></span>
            </td>
        </tr>

        <%--生成订单    --%>
        <c:if test="${!empty ois}">
            <tr>
                <td>
                    <a href="shopping" class="btn btn-success" role="button">
                        继续添加
                    </a>
                </td>
                <c:if test="${!empty information}">
                    <td colspan="8" align="right">
                        <a href="orderCreate?iid=${sessionScope.information.id}" class="btn btn-success" role="button">
                            生成订单
                        </a>
                    </td>
                </c:if>
                <c:if test="${empty information}">
                    <td colspan="8" align="right">
                        <a href="informationGet" class="btn btn-success" role="button">
                            收货信息
                        </a>
                    </td>
                </c:if>
            </tr>
        </c:if>
        </tbody>
    </table>


</div>
<script type="text/javascript">
    //增加
    $(function () {
        $("#tBody").on("click", "button[name=add]", function () {
            var id = $(this).attr("buttonID");
            var num = 1;
            submit(id, num);
        })
        $("#tBody").on("click", "button[name=minus]", function () {
            var id = $(this).attr("buttonID");
            var num = -1;
            submit(id, num);
        })

    });

    function submit(id, num) {
        $.ajax({
            type: "POST",
            url: "/shoppingCartAjax",
            data: {num: num, pid: id},
            dataType: "json",
            success: function (list) {
                document.getElementById("count").innerHTML = list[1].toFixed(2);
                document.getElementById("num+" + id).innerHTML = list[0];
                document.getElementById("clothing+"+ id).innerHTML = list[2].toFixed(2);
                if(list[0]===0){
                    window.location='shoppingCart_jsp';
                }
            }
        })
    }


</script>
</body>
</html>
