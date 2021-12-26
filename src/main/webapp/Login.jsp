<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！ --%>
    <link rel="icon" href="image/icons8-musical-notes-24.png">

    <title>登录页</title>

    <%--jQuery--%>
    <script src="js/jquery-3.6.0.min.js"></script>
    <%--Bootstrap JavaScript--%>
    <script src="js/bootstrap.min.js"></script>
    <%--Bootstrap--%>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <%--FontAwesome--%>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/Login.css" rel="stylesheet">
</head>
<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="container">
            <div class="signin">
                <form name="loginForm" class="form-inline" action="LoginServlet" method="get">
                    <h2 class="heading">登录</h2>
                    <label for="userName" class="sr-only">用户名</label>
                    <input type="text" name="userName" id="userName" class="form-control" placeholder="用户名" required=""
                           autofocus="">
                    <label for="userPassword" class="sr-only">密码</label>
                    <input type="password" name="userPassword" id="userPassword" class="form-control"
                           placeholder="密码" required="">
                    <br>
                    <div class="form-group">
                        <div class="col-md-4">
                            <input name="register" class="btn btn-lg btn-success btn-block" value="注册"
                                   onclick="javascript:window.location.href='Register.jsp'">
                        </div>
                        <div class="col-md-4">
                            <input class="btn btn-lg btn-primary btn-block" type="submit" value="登录">
                        </div>
                        <div class="col-md-4">
                            <input class="btn btn-lg btn-danger btn-block" type="reset" value="重置">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>

</div>


</body>
</html>
