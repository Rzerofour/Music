<%--suppress HtmlFormInputWithoutLabel --%>
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

    <title>个人中心</title>

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
        $('#modifyModal').modal()
        $(function () {
            // 修改框
            $('#modifyMusicModal').on('show.bs.modal', function (event) {
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
<%
    String user = request.getParameter("user");
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ManageMusic.jsp?class=0"><i class="fa fa-home fa-fw"
                                                                      aria-hidden="true"></i>个人中心</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Login.jsp">退出中心</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="PersonalManage.jsp?class=0&user=<%=user%>" method="post">
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
                <div class=" col-md-3 placeholder">
                    <img src="image/icons8-user-64.png"
                         width="200" height="200" class="img-responsive img-circle" alt="用户头像">
                    <h4>欢迎，<%=user%>!</h4>
                </div>
                <div class="col-md-9">
                    <div class="col-md-3">
                        <button type="button" class="btn btn-lg btn-primary btn-block" data-toggle="modal"
                                data-target="#modifyModal">修改
                        </button>
                    </div>
                    <div class="col-md-3 ">
                        <button type="button" class="btn btn-lg btn-danger btn-block"
                                onclick="window.location.href='PersonalDeleteSelfServlet?oldName=<%=user%>'">删除
                        </button>
                    </div>
                    <div class="col-md-3 ">
                        <button type="button" class="btn btn-lg btn-success btn-block"
                                onclick="window.location.href='GetMusic.jsp?class=0&user=<%=user%>'">探索
                        </button>
                    </div>
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
                    <div class="col-md-2">
                        <label for="classAll" class="sr-only"></label>
                        <input name="classAll" id="classAll" class=" class btn btn-lg btn-default btn-block"
                               value="全部歌曲"
                               onclick="window.location.href='PersonalManage.jsp?class=0&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class1" class="sr-only"></label>
                        <input name="class1" id="class1" class="class btn btn-lg btn-default btn-block" value="流行"
                               onclick="window.location.href='PersonalManage.jsp?class=1&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class2" class="sr-only"></label>
                        <input name="class2" id="class2" class="class btn btn-lg btn-default btn-block" value="民谣"
                               onclick="window.location.href='PersonalManage.jsp?class=2&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class3" class="sr-only"></label>
                        <input name="class3" id="class3" class="class btn btn-lg btn-default btn-block" value="嘻哈"
                               onclick="window.location.href='PersonalManage.jsp?class=3&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class4" class="sr-only"></label>
                        <input name="class4" id="class4" class="btn btn-lg btn-default btn-block" value="摇滚"
                               onclick="window.location.href='PersonalManage.jsp?class=4&user=<%=user%>'">
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>歌名</th>
                        <th>歌手</th>
                        <th>评分</th>
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
                    <%--classAll--%>
                    <%
                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.getMyMusicList(user);
                        for (MyMusic p : pl) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                删除
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                    <%
                            break;
                        }
                        case "1": {%>
                    <%--class1--%>
                    <%
                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.getMyMusicList(user);
                        for (MyMusic p : pl) {
                            if (p.isClass1()) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                删除
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>

                    <%
                            break;
                        }
                        case "2": {%>

                    <%

                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.getMyMusicList(user);
                        for (MyMusic p : pl) {
                            if (p.isClass2()) {
                    %>
                    <%--class2--%>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                删除
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>

                    <%
                            break;
                        }
                        case "3": {%>
                    <%--class3--%>
                    <%
                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.getMyMusicList(user);
                        for (MyMusic p : pl) {
                            if (p.isClass3()) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                删除
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>

                    <%
                            break;
                        }
                        case "4": {%>
                    <%--class4--%>
                    <%
                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.getMyMusicList(user);
                        for (MyMusic p : pl) {
                            if (p.isClass4()) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                删除
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>

                    <%
                                break;
                            }
                        }
                    }
                    //如果搜索，显示searchResult.jsp
                    else {
                    %>
                    <%--searchResult--%>
                    <%
                        PersonalManage a = new PersonalManage();
                        ArrayList<MyMusic> pl = a.searchMyMusic(user, word);
                        for (MyMusic p : pl) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
                        </td>
                        <td><%=p.getLevel() %>
                        </td>
                        <td>
                            <form name='playMusicForm' action='Play.jsp'>
                                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                                <button type='submit' class="btn btn-success" name='submit'><i
                                        class="fa fa-play-circle-o" aria-hidden="true"></i></button>
                            </form>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link"
                                    onclick="window.location.href='PersonalDeleteMyMusicServlet?id=<%=p.getID() %>&owner=<%=p.getOwner()%>'">
                                评分
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target="#modifyMusicModal" data-whatever="<%=p.getID() %>">评分
                            </button>
                        </td>
                    </tr>

                    <%} %>

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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="uploadModalLabel">上传你的音乐至曲库！</h4>
            </div>
            <form action="PersonalUploadMusicServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="uploadFile">上传音乐</label>
                        <input type="file" id="uploadFile" name="file" accept="audio/mpeg,audio/wav,audio/ogg"
                               required="">
                        <p class="help-block">请上传MP3、Wav、Ogg格式文件！</p>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            所属类别：
                            <input type="checkbox" name="musicClass1" id="modifyMusicClass1" value="true">
                            <label for="modifyMusicClass1">流行</label>
                            <input type="hidden" name="musicClass1" value="false">
                            <input type="checkbox" name="musicClass2" id="modifyMusicClass2" value="true">
                            <label for="modifyMusicClass2">民谣</label>
                            <input type="hidden" name="musicClass2" value="false">
                            <input type="checkbox" name="musicClass3" id="modifyMusicClass3" value="true">
                            <label for="modifyMusicClass3">嘻哈</label>
                            <input type="hidden" name="musicClass3" value="false">
                            <input type="checkbox" name="musicClass4" id="modifyMusicClass4" value="true">
                            <label for="modifyMusicClass4">摇滚</label>
                            <input type="hidden" name="musicClass4" value="false">
                        </div>
                        <div class="form-group">
                            是否公开：
                            <input type="radio" name="up" value="1">是
                            <input type="radio" name="up" value="0">否<br>
                            <input hidden="hidden" type="text" name="name" value="<%=user %>"/>
                        </div>
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
<div class="modal fade" id="modifyMusicModal" tabindex="-1" role="dialog" aria-labelledby="modifyMusicModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modifyMusicModalLabel">评分</h4>
            </div>
            <form name='formModify' method='post' action='UpdateMusicLevelServlet'>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input id="id" name='id' type='text' class="form-control" value="" readonly>
                        <input hidden="hidden" type="text" name="name" value="<%=user %>"/>
                        <label for="level">评分</label>
                        <input type="number" min="0" max="10" class="form-control" name="level" id="level">
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

<%--用户修改动态框--%>
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modifyModalLabel">修改个人信息</h4>
            </div>
            <form name='userModify' method='post' action='PersonalModifySelfServlet'>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="oldName">旧的用户名</label>
                        <input id="oldName" name="oldName" class="form-control"
                               value="<%=user%>" readonly>
                        <label for="userName">新的用户名</label>
                        <input id="userName" name='userName' type='text' class="form-control" placeholder="用户名"
                               required="">
                        <label for="userPassword">新的密码</label>
                        <input id="userPassword" name='userPassword' type='text' class="form-control"
                               placeholder="密码"
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
