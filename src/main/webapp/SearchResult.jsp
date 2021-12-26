<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>搜索结果</title>
</head>
<body>
<input type="button" name="managemusic" value="返回主界面" onclick="javascript:window.location.href='ManageMusic.jsp'"><br>

<table>
    <tr>

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
        String word = request.getParameter("partname");
        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.searchMusic(word);
        for (Music p : pl) {
    %>
    <tr>

        <td><%=p.getTitle() %>
        </td>
        <td><%=p.getSinger() %>
        </td>
        <td><a href='ManageModifyMusic.jsp?MusicID=<%=p.getID() %>'>修改</a></td>
        <td><a href='ManageDeleteMusicServlet?MusicID=<%=p.getID() %>'>删除</a></td>
    </tr>

    <%} %>
</table>
</body>
</html>