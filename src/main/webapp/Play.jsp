<%@ page contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！ --%>
    <link rel="icon" href="image/icons8-musical-notes-24.png">

    <title>播放页</title>

    <%--jQuery--%>
    <script src="js/jquery-3.6.0.min.js"></script>
    <%--Bootstrap JavaScript--%>
    <script src="js/bootstrap.min.js"></script>
    <%--Bootstrap--%>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <%--FontAwesome--%>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/Play.css" rel="stylesheet">
</head>
<body>
<jsp:useBean id="Music" class="JavaBean.Music"/>
<jsp:setProperty name="Music" property="title" param="musicTitle"/>
<jsp:setProperty name="Music" property="singer" param="musicSinger"/>
<jsp:setProperty name="Music" property="url" param="musicUrl"/>
<jsp:setProperty name="Music" property="lyric" param="musicLyric"/>


<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"><a onclick="window.history.back()"><i
                        class="fa fa-sign-out"></i></a></li>
            </ul>
        </nav>
        <h3 class="text-muted">播放音乐</h3>
    </div>

    <div class="jumbotron">
        <h1>
            <jsp:getProperty name="Music" property="title"/>
        </h1>
        <p class="lead">
            <jsp:getProperty name="Music" property="singer"/>
        </p>
        <audio controls>
            <source src="<%=Music.getUrl()%>" type="audio/mpeg">
            <source src="<%=Music.getUrl()%>" type="audio/ogg">
            <source src="<%=Music.getUrl()%>" type="audio/wav">
        </audio>
    </div>

    <div class="row marketing">
        <div >
            <h3>歌词</h3>
            <% if (Music.getLyric()==null) {
                out.print("<p>歌词未找到！</p>");

            } else {
                String oldLyric= Music.getLyric();
                oldLyric=oldLyric.replaceAll("\\[","<br>\\[");
                String newLyric=oldLyric.replaceFirst("<br>","");
                out.print("<p>" + newLyric + "</p>");
            } %>

        </div>
    </div>
    <div>
        <footer class="footer">
            <p>Enjoy music<i class="fa fa-ellipsis-h" aria-hidden="true"></i></p>
        </footer>

    </div>
</div>

</body>
</html>
