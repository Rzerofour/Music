<%@ page contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--TODO:个人中心--%>
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

    <script>
        // 上传框
        $('#uploadModal').modal()
        $(function () {
            // 修改框
            $('#modifyModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('whatever');
                var modal = $(this);
                modal.find('.modal-body input[name=id]').val(id);
            })
            // 分类导航
            $(".class").click(function () {
                $("#content").empty();
            })
        })
    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ManageMusic.jsp?class=0"><i class="fa fa-home fa-fw"
                                                                      aria-hidden="true"></i>个人管理中心</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Login.jsp">退出中心</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="ManageMusic.jsp?class=0" method="post">
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
            <h1 class="page-header">编辑个人信息</h1>

            <div class="row placeholders">


            </div>

            <h2 class="sub-header">曲库列表</h2>


            <label for="upload" class="sr-only"></label>
            <button type="button" name="upload" id="upload" data-toggle="modal" data-target="#uploadModal"
                    class="btn btn-lg btn-primary"><i class="fa fa-upload" aria-hidden="true"></i>上传音乐
            </button>
            <div class="table-responsive">

                <div class="form-group">
                    <br>
                    <div class="col-md-2">
                        <label for="classAll" class="sr-only"></label>
                        <input name="classAll" id="classAll" class=" class btn btn-lg btn-default btn-block"
                               value="全部歌曲"
                               onclick="window.location.href='ManageMusic.jsp?class=0'">
                    </div>
                    <div class="col-md-2">
                        <label for="class1" class="sr-only"></label>
                        <input name="class1" id="class1" class="class btn btn-lg btn-default btn-block" value="分类1"
                               onclick="window.location.href='ManageMusic.jsp?class=1'">
                    </div>
                    <div class="col-md-2">
                        <label for="class2" class="sr-only"></label>
                        <input name="class2" id="class2" class="class btn btn-lg btn-default btn-block" value="分类2"
                               onclick="window.location.href='ManageMusic.jsp?class=2'">
                    </div>
                    <div class="col-md-2">
                        <label for="class3" class="sr-only"></label>
                        <input name="class3" id="class3" class="class btn btn-lg btn-default btn-block" value="分类3"
                               onclick="window.location.href='ManageMusic.jsp?class=3'">
                    </div>
                    <div class="col-md-2">
                        <label for="class4" class="sr-only"></label>
                        <input name="class4" id="class4" class="btn btn-lg btn-default btn-block" value="分类4"
                               onclick="window.location.href='ManageMusic.jsp?class=4'">
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>歌名</th>
                        <th>歌手</th>
                        <th>播放</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <jsp:useBean id="Music" class="JavaBean.Music" scope="session">
                        <jsp:setProperty name="Music" property="*"/>
                    </jsp:useBean>
                    <tbody id="content">
                    <%
                        String word = request.getParameter("partname");
                        String classID = request.getParameter("class");
                        //如果不搜索，根据class显示
                        if (word == null) {
                            switch (classID) {
                                case "0": {%>
                    <jsp:include page="classAll.jsp" flush="true"/>
                    <%
                            break;
                        }
                        case "1": {%>
                    <jsp:include page="class1.jsp" flush="true"/>
                    <%
                            break;
                        }
                        case "2": {%>
                    <jsp:include page="class2.jsp" flush="true"/>
                    <%
                            break;
                        }
                        case "3": {%>
                    <jsp:include page="class3.jsp" flush="true"/>
                    <%
                            break;
                        }
                        case "4": {%>
                    <jsp:include page="class4.jsp" flush="true"/>
                    <%
                                break;
                            }
                        }
                    }
                    //如果搜索，显示searchResult.jsp
                    else {
                    %>
                    <jsp:include page="SearchResult.jsp?partname=<%=word%>" flush="true"/>
                    <%
                        }
                    %>
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
                        <input type="file" id="uploadFile" name="file" accept="audio/mpeg,audio/wav,audio/ogg"
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
                        <input id="id" name='id' type='text' class="form-control" value="" readonly>
                        <label for="title">歌名</label>
                        <input id="title" name='title' type='text' class="form-control" placeholder="歌名" required="">
                        <label for="singer">歌手</label>
                        <input id="singer" name='singer' type='text' class="form-control" placeholder="歌手" required="">
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
