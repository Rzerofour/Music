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
    <title>添加喜爱的歌曲到个人歌单</title>
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
<div class="container-fluid">
    <div class="row">
        <form class="navbar-form navbar-right" action="GetMusic.jsp?class=0&user=<%=user%>" method="post">
            <div class="input-group">
                <label for="partname" class="sr-only"></label>
                <input type="text" class="form-control" id="partname" name="partname" placeholder="按歌名搜索...">
                <span class="input-group-btn">
                        <input class="btn btn-default" type="submit" value="GO!">
                    </span>
            </div>
        </form>
        <div class="col-sm-12  col-md-12  main">

            <div class="table-responsive">

                <div class="form-group">
                    <br>
                    <div class="col-md-2">
                        <label for="classAll" class="sr-only"></label>
                        <input name="classAll" id="classAll" class=" class btn btn-lg btn-default btn-block"
                               value="全部歌曲"
                               onclick="window.location.href='GetMusic.jsp?class=0&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class1" class="sr-only"></label>
                        <input name="class1" id="class1" class="class btn btn-lg btn-default btn-block" value="流行"
                               onclick="window.location.href='GetMusic.jsp?class=1&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class2" class="sr-only"></label>
                        <input name="class2" id="class2" class="class btn btn-lg btn-default btn-block" value="民谣"
                               onclick="window.location.href='GetMusic.jsp?class=2&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class3" class="sr-only"></label>
                        <input name="class3" id="class3" class="class btn btn-lg btn-default btn-block" value="嘻哈"
                               onclick="window.location.href='GetMusic.jsp?class=3&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="class4" class="sr-only"></label>
                        <input name="class4" id="class4" class="btn btn-lg btn-default btn-block" value="摇滚"
                               onclick="window.location.href='GetMusic.jsp?class=4&user=<%=user%>'">
                    </div>
                    <div class="col-md-2">
                        <label for="return" class="sr-only"></label>
                        <input name="return" id="return" class="btn btn-lg btn-danger btn-block" value="返回歌单"
                               onclick="window.location.href='PersonalManage.jsp?class=0&user=<%=user%>'">
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>歌名</th>
                        <th>歌手</th>
                        <th>播放</th>
                        <th>操作</th>
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
                        ManageMusic a = new ManageMusic();
                        ArrayList<Music> pl = a.getMusicList();
                        for (Music p : pl) {
                            if (p.getUploader() == null || p.getUploader().equals(user)) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    <%
                            break;
                        }
                        case "1": {%>
                    <%--class1--%>
                    <%
                        ManageMusic a = new ManageMusic();
                        ArrayList<Music> pl = a.getMusicList();
                        for (Music p : pl) {
                            if (p.isClass1() && (p.getUploader() == null || p.getUploader().equals(user))) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
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

                        ManageMusic a = new ManageMusic();
                        ArrayList<Music> pl = a.getMusicList();
                        for (Music p : pl) {
                            if (p.isClass2() && (p.getUploader() == null || p.getUploader().equals(user))) {
                    %>
                    <%--class2--%>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
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

                        ManageMusic a = new ManageMusic();
                        ArrayList<Music> pl = a.getMusicList();
                        for (Music p : pl) {
                            if (p.isClass3() && (p.getUploader() == null || p.getUploader().equals(user))) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
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

                        ManageMusic a = new ManageMusic();
                        ArrayList<Music> pl = a.getMusicList();
                        for (Music p : pl) {
                            if (p.isClass4() && (p.getUploader() == null || p.getUploader().equals(user))) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
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
                        ArrayList<Music> pl = a.searchMusic(word);
                        for (Music p : pl) {
                            if (p.getUploader() == null || p.getUploader().equals(user)) {
                    %>
                    <tr>
                        <td><%=p.getID() %>
                        </td>
                        <td><%=p.getTitle() %>
                        </td>
                        <td><%=p.getSinger() %>
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
                        <td><a href='AddMyMusicServlet?MusicID=<%=p.getID() %>&user=<%=user%>'>添加至歌单</a></td>
                    </tr>

                    <%} %>

                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
