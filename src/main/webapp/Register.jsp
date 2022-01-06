<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！ --%>
    <link rel="icon" href="image/icons8-musical-notes-24.png">

    <title>注册页</title>

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


    <script>
        $.extend({
            "checkRadio": function () {
                if ($('input[type=radio][name=manager]:checked').val() === "是") {
                    $("#inputKey").show();
                    $("#key").attr("required", "required");
                } else if ($('input[type=radio][name=manager]:checked').val() === "否") {
                    $("#inputKey").hide();
                    $("#key").removeAttr("required");
                }
            }
        })
        $(function () {
            $('input[type=radio][name=manager]').change(function () {
                $.checkRadio()
            })
            $("input[type=reset]").click(function () {
                $.checkRadio()
            })
        })

    </script>
</head>
<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="container">
            <div class="signin">
                <form name="registerForm" class="form-inline" action="RegisterServlet" method="get">
                    <h2 class="heading">注册新用户</h2>
                    <label for="userName" class="sr-only">用户名</label>
                    <input type="text" name="userName" id="userName" class="form-control" placeholder="用户名" required=""
                           autofocus="">
                    <label for="userPassword" class="sr-only">密码</label>
                    <input type="password" name="userPassword" id="userPassword" class="form-control"
                           placeholder="密码" required="">
                    <br>
                    <div class="form-group">
                        <label>管理员：</label>
                        <label><input type="radio" name="manager" value="是">是</label>
                        <label><input type="radio" name="manager" value="否" checked="">否</label>
                    </div>
                    <div id="inputKey" hidden="hidden">
                        <label>请输入确认密钥：</label><br>
                        <label for="key" class="sr-only">密钥</label>
                        <input type="text" name="key" id="key" class="form-control"
                               placeholder="密钥"><br>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <input class="btn btn-lg btn-primary btn-block" type="submit" value="注册">
                        </div>
                        <div class="col-md-4">
                            <input class="btn btn-lg btn-danger btn-block" type="reset" value="重置">
                        </div>
                        <div class="col-md-4">
                            <input class="btn btn-lg btn-info btn-block" name="login" value="返回"
                                   onclick="window.location.href='Login.jsp'">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>

</div>


</body>
</html>
