<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>
<div style="width: 500px; margin:30px auto" >
    <h1  style="text-align:center;margin: 20px">注册</h1>
    <form class="layui-form  layui-form-pane" action="register" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">会员名</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="username" required placeholder="请输入会员名"
                       autocomplete="on" class="layui-input" onkeyup="check()" >
            </div>
        </div>

        <div class=""><span id="result"></span></div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input" id="password"  >
            </div>
        </div>
        <%--        某个键盘按键被松开--%>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="" required lay-verify="required" placeholder="请再次输入密码"
                       autocomplete="off" class="layui-input"  id="password2" onkeyup="check()" >
            </div>
            <div class=""><span id="prompt"></span></div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="submit" id="submit">立即提交</button>
                <a href="login_jsp" class="layui-btn">已有账号</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    //ajax验证用户名是否存在
    function check() {
        var username = document.getElementById("username").value;
        var url = "registerAjax?username="+ username;
        xmlhttp = new XMLHttpRequest();
        //设置响应函数
        xmlhttp.onreadystatechange = checkResult;
        //设置访问页面
        xmlhttp.open("POST", url, true);
        //执行访问
        xmlhttp.send(null);
    }
    //响应函数
    function checkResult() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //会员名
            document.getElementById("result").innerHTML = xmlhttp.responseText;
            //密码
            const password = document.getElementById("password").value;
            const password2 = document.getElementById("password2").value;
            if(password===password2) {
                document.getElementById("prompt").innerHTML="<br><p style='color: green'>两次输入密码一致!</p>";
            }
            if(password!==password2) {
                document.getElementById("prompt").innerHTML="<br><p style='color: red' >两次输入密码不一致!</p>";
                document.getElementById("submit").disabled =true;
            }
            if(xmlhttp.responseText!=="<p style='color: red' >会员名可用</p>"){
                document.getElementById("submit").disabled = true;
            }

            if(password===password2 && xmlhttp.responseText==="<p style='color: green' >会员名可用</p>"){
                document.getElementById("submit").disabled = false;
            }


        }



        // //验证两次密码是否一致,
        // function checkPassword() {
        //     const password = document.getElementById("password").value;
        //     const password2 = document.getElementById("password2").value;
        //
        //     if(password===password2) {
        //         document.getElementById("prompt").innerHTML="<br><p style='color: green'>两次输入密码一致!</p>";
        //         document.getElementById("submit").disabled = false;
        //
        //     }else {
        //         document.getElementById("prompt").innerHTML="<br><p style='color: red' >两次输入密码不一致!</p>";
        //         document.getElementById("submit").disabled =true;
        //     }
        // }



    }




</script>

</body>
</html>
