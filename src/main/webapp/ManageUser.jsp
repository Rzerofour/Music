<%@ page contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！ --%>
    <link rel="icon" href="image/icons8-musical-notes-24.png">

    <title>用户管理中心</title>

    <%--jQuery--%>
    <script src="js/jquery-3.6.0.min.js"></script>
    <%--Bootstrap JavaScript--%>
    <script src="js/bootstrap.min.js"></script>
    <%--Bootstrap--%>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <%--FontAwesome--%>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/Manage.css" rel="stylesheet">

    <script>
        $(function () {
            // 修改框
            $('#modifyModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var oldName = button.data('whatever');
                var modal = $(this);
                modal.find('.modal-body input[name=oldName]').val(oldName);
            })
        })
    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ManageUser.jsp"><i class="fa fa-home fa-fw" aria-hidden="true"></i>个人管理中心</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="ManageMusic.jsp?class=0">音乐管理中心</a></li>
                <li><a href="Login.jsp">退出中心</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <div class="col-sm-12  col-md-12  main">

            <h2 class="sub-header">用户列表</h2>


            <label for="addUser" class="sr-only"></label>
            <button type="button" name="addUser" id="addUser"
                    class="btn btn-lg btn-primary" onclick="window.location.href='AddUser.jsp'"><i
                    class="fa fa-plus-square-o"
                    aria-hidden="true"></i>新增用户
            </button>
            <div class="table-responsive">

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>管理员</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <jsp:useBean id="Music" class="JavaBean.Music">
                        <jsp:setProperty name="Music" property="*"/>
                    </jsp:useBean>
                    <tbody id="content">
                    <%
                        ManageUser a = new ManageUser();
                        ArrayList<User> pl = a.getUserList();
                        for (User p : pl) {
                    %>
                    <tr>
                        <td><%=p.getUserName() %>
                        </td>
                        <td><%=p.getUserPassword() %>
                        </td>
                        <td><%
                            if (p.isManager()) { %>
                            <i class="fa fa-check" aria-hidden="true"></i>
                            <%}%>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyModal" data-whatever="<%=p.getUserName() %>">修改
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='ManageDeleteUserServlet?oldName=<%=p.getUserName()%>'">
                                删除
                            </button>
                        </td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%--用户修改动态框--%>
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modifyModalLabel">修改个人信息</h4>
            </div>
            <form name='userModify' method='post' action='ManageModifyUserServlet'>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="oldName">旧的用户名</label>
                        <input id="oldName" name="oldName" class="form-control" value="" readonly>
                        <label for="userName">新的用户名</label>
                        <input id="userName" name='userName' type='text' class="form-control" placeholder="用户名"
                               required="">
                        <label for="userPassword">新的密码</label>
                        <input id="userPassword" name='userPassword' type='text' class="form-control" placeholder="密码"
                               required="">
                        <br>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type='submit' class="btn btn-primary" name='submit' value="提交">
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
