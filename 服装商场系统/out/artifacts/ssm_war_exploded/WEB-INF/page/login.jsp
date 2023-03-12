<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录界面</title>
    <style>
        body {
            background: #ddd;
            padding: 0;
            margin: 0;
        }

        a {
            text-decoration: none;
        }

        .bg {
            background: #ddd;
            /* 清除浮动 子元素为float浮动时,父元素高度为0,要清除浮动才显示正常 */
            overflow: hidden;
        }

        .mid {
            background: white;
            float: left;
            border-radius: 20px;
            position: absolute;
            /*距离右边80px*/
            left: 500px;
            /*往下移动180px*/
            top: 80px;
        }

        .cc {
            padding: 50px;
        }

        .kb {
            height: 40px;
        }

        .cc h1 {
            color: black;
            text-align: center;
        }

        .mid input {
            text-align: left;
            font-size: 20px;
            width:340px;
            height: 50px;
            line-height: 50px;
            padding: 0 20px;
            border: 1px solid #aaa;
            border-radius: 5px;

        }

        .mid .submit {
            border-radius: 2rem;
            color: #fff;
            background-color: rgb(62, 107, 226);
            border: 3px solid rgb(62, 107, 226);
            padding: 0 40px 0 40px;
            font-size: 0.9em;
            font-weight: 500;
            width: 100%;
            height: 40px;
            line-height: 36px;
            display: inline-block;
            text-align: center;
        }

        .xx {
            height: 50px;
        }
    </style>

</head>

<body>

<div class="kb"></div>
<div class="bg">
    <div class="mid">
        <div class="cc">
            <h1>登录</h1>
            <hr color="#ddd">
            <form action="login" method="post">
                <br>
                <input type="text" name="username" placeholder="账号"><br><br>
                <input type="password" name="password" placeholder="密码"><br><br>
                <a href="login_jsp">重置</a><br><br>
                <button type="submit" class="submit">登录</button>
<%--                <button type="reset">重置</button>--%>
            </form>
            <br>
            <div class="xx">
                <a href="register_jsp">注册会员</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>