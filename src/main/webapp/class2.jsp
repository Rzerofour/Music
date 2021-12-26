<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>分类检索</title>
</head>
<body>
<input type="button" name="主页" value="返回主页" onclick="javascript:window.location.href='ManageMusic.jsp'">
<input type="button" name="class1" value="class1" onclick="javascript:window.location.href='class1.jsp'">
<input type="button" name="class3" value="class3" onclick="javascript:window.location.href='class3.jsp'">
<input type="button" name="class4" value="class4" onclick="javascript:window.location.href='class4.jsp'">
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

        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.getMusicList();
        for (Music p : pl) {
            if (p.isClass2()) {
    %>
    <tr>

        <td><%=p.getTitle() %>
        </td>
        <td><%=p.getSinger() %>
        </td>
        <td><a href='ManageModifyMusic.jsp?MusicID=<%=p.getID() %>'>修改</a></td>
        <td><a href='ManageDeleteMusicServlet?MusicID=<%=p.getID() %>'>删除</a></td>
    </tr>

    <%
            }
        }
    %>
</table>
</body>
</html>