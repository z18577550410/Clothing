<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2022/11/22
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form" action="#" method="post" enctype="multipart/form-data" onsubmit="return false">
    <input type="text" name="userId" id="userId" required/>
    <input type="password" name="password" id="psw" required/>
    <button type="button" onclick="login()">登录</button>
</form>
<script>
    function login() {
        var userId = document.getElementById(userId).value;
        var password = document.getElementById(psw).value;
        $.ajax({
            type: "post",
            dataType: "json",
            //方法一
            url: "test",
            data: {
                userId: userId,
                password: password
            },
            //****************************//
            /*方法二*/
            //url："/login?userId="+userId+"&password="+password,
            //data:null,
            //*****************************//
            cache: false,
            success: function (result) {
                if (result == true) {
                    alert("true");
                } else {
                    alert("false");
                }
            },
            error: function () {
                alert("ajax出现异常");
            }
        });
    }
</script>
</body>
</html>
