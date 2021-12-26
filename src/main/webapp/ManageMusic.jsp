<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>管理音乐</title>
</head>
<body>
<input type="button" name="manageuser" value="用户管理" onclick="javascript:window.location.href='ManageUser.jsp'">
<input type="button" name="managemusic" value="音乐管理" onclick="javascript:window.location.href='ManageMusic.jsp'"><br>
<form action="SerchServlet" mathod="post">
    <input type="text" placeholder="请输入歌名" name="partname">
    <input type="submit" value="搜索">
</form>
<input type="button" name="upload" value="上传" onclick="javascript:window.location.href='UploadTest.jsp'">
<table>
    <tr>
        <td>
            <fron>选择</fron>
        </td>
        <td>
            <fron>歌名</fron>
        </td>
        <td>
            <fron>歌手</fron>
        </td>
        <td>
            <fron>操作</fron>
        </td>
    </tr>
    <jsp:useBean id="Music" class="JavaBean.Music">
        <jsp:setProperty name="Music" property="*"/>
    </jsp:useBean>
    <%
        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.getMusicList();
        for (Music p : pl) {
    %>
    <tr>
        <td>><input type="checkbox" name="select"></td>
        <td><%=p.getTitle() %>
        </td>
        <td><%=p.getSinger() %>
        </td>
        <td><a href='ManageModifyMusicServlet?MusicID=<%=p.getID() %>'>修改</a></td>
        <td><a href='ManageDeleteMusicServlet?MusicID=<%=p.getID() %>'>删除</a></td>
    </tr>

    <%} %>
</table>
</body>
</html>