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

    <title>音乐管理中心</title>

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
<%--TODO：播放页！！！--%>
    <%
        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.getMusicList();
    %>
    <script>

        $('#uploadModal').modal()
        $(function () {
        $('#modifyModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id=button.data('whatever');
            var modal = $(this);
            modal.find('.modal-body input[name=id]').val(id);
        })
        })
    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ManageMusic.jsp"><i class="fa fa-home fa-fw" aria-hidden="true"></i>音乐管理中心</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="ManageUser.jsp">用户管理中心</a></li>
                <li><a href="Login.jsp">退出中心</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="SearchResult.jsp" method="post">
                <div class="input-group">
                    <label for="partname" class="sr-only"></label>
                    <input type="text" class="form-control" id="partname" name="partname" placeholder="按歌名搜索...">
                    <span class="input-group-btn">
                        <input class="btn btn-default" type="submit" value="GO!">
                    </span>
                </div>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <div class="col-sm-12  col-md-12  main">
            <h1 class="page-header">在这里你可以...</h1>

            <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="image/icons8-upload-64.png"
                         width="200" height="200" class="img-responsive img-circle" alt="上传">
                    <h4>上传</h4>

                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="image/icons8-edit-64.png"
                         width="200" height="200" class="img-responsive img-circle" alt="修改">
                    <h4>修改</h4>

                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="image/icons8-trash-64.png"
                         width="200" height="200" class="img-responsive img-circle" alt="删除">
                    <h4>删除</h4>

                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="image/icons8-search-64.png"
                         width="200" height="200" class="img-responsive img-circle" alt="搜索">
                    <h4>搜索</h4>
                </div>
            </div>

            <h2 class="sub-header">曲库列表</h2>

            <label for="upload" class="sr-only"></label>
            <button type="button" name="upload" id="upload" data-toggle="modal" data-target="#uploadModal"
                    class="btn btn-lg btn-primary"><i class="fa fa-upload" aria-hidden="true"></i>上传音乐
            </button>
            <div class="table-responsive">

                <div class="form-group">
                    <br>
                    <div class="col-md-3">
                        <label for="class1" class="sr-only"></label>
                        <input name="class1" id="class1" class="btn btn-lg btn-default btn-block" value="class1"
                               onclick="window.location.href='class1.jsp'">
                    </div>
                    <div class="col-md-3">
                        <label for="class2" class="sr-only"></label>
                        <input name="class2" id="class2" class="btn btn-lg btn-default btn-block" value="class2"
                               onclick="window.location.href='class2.jsp'">
                    </div>
                    <div class="col-md-3">
                        <label for="class3" class="sr-only"></label>
                        <input name="class3" id="class3" class="btn btn-lg btn-default btn-block" value="class3"
                               onclick="window.location.href='class3.jsp'">
                    </div>
                    <div class="col-md-3">
                        <label for="class4" class="sr-only"></label>
                        <input name="class4" id="class4" class="btn btn-lg btn-default btn-block" value="class4"
                               onclick="window.location.href='class4.jsp'">
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <td>歌名</td>
                        <td>歌手</td>
                        <td colspan="2">操作</td>
                    </tr>
                    </thead>
                    <jsp:useBean id="Music" class="JavaBean.Music">
                        <jsp:setProperty name="Music" property="*"/>
                    </jsp:useBean>
                    <tbody>
                    <%
                        for (Music p : pl) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td>
                            <button type="button"  class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyModal" data-whatever="<%=p.getID() %>">修改
                            </button>
                        </td>
                        <td>
                            <button type="button"  class="btn btn-link"
                                    onclick="window.location.href='ManageDeleteMusicServlet?MusicID=<%=p.getID() %>'">删除
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

<%--文件上传动态框--%>
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="uploadModalLabel">上传你的音乐至曲库！</h4>
            </div>
            <form action="ManageUploadMusicServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="uploadFile">上传音乐</label>
                        <input type="file" id="uploadFile" name="file" accept="audio/mp3,audio/wav,audio/ogg"
                               required="">
                        <p class="help-block">请上传MP3、Wav、Ogg格式文件！</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="上传"/>
                </div>
            </form>
        </div>
    </div>
</div>

<%--文件修改动态框--%>
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modifyModalLabel">修改音乐信息</h4>
            </div>
            <form name='formModify' method='post' action='ManageModifyMusicServlet'>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input id="id" name='id' type='text' class="form-control"  value="" readonly>
                        <label for="title">歌名</label>
                        <input id="title" name='title'  type='text' class="form-control" placeholder="歌名" required="">
                        <label for="singer">歌手</label>
                        <input id="singer" name='singer' type='text' class="form-control" placeholder="歌手" required="" >
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
