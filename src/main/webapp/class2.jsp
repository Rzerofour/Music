<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>分类检索</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<input type="button" name="主页" value="返回主页" onclick="javascript:window.location.href='ManageMusic.jsp'">--%>
<%--<input type="button" name="class1" value="class1" onclick="javascript:window.location.href='class1.jsp'">--%>
<%--<input type="button" name="class3" value="class3" onclick="javascript:window.location.href='class3.jsp'">--%>
<%--<input type="button" name="class4" value="class4" onclick="javascript:window.location.href='class4.jsp'">--%>
<%--<table>--%>
<%--    <tr>--%>

<%--        <td>--%>
<%--            <fron>歌名</fron>--%>
<%--        </td>--%>
<%--        <td>--%>
<%--            <fron>歌手</fron>--%>
<%--        </td>--%>
<%--        <td>--%>
<%--            <fron>操作</fron>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <jsp:useBean id="Music" class="JavaBean.Music">--%>
<%--        <jsp:setProperty name="Music" property="*"/>--%>
<%--    </jsp:useBean>--%>

    <%

        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.getMusicList();
        for (Music p : pl) {
            if (p.isClass2()) {
    %>
    <tr>
        <td><%=p.getID() %>
        </td>
        <td><%=p.getTitle() %>
        </td>
        <td><%=p.getSinger() %>
        </td>
        <td>
            <form name='playMusicForm' action='Play.jsp'>
                <input hidden="hidden" type="text" name="musicTitle" value="<%=p.getTitle() %>"/>
                <input hidden="hidden" type="text" name="musicSinger" value="<%=p.getSinger() %>"/>
                <input hidden="hidden" type="text" name="musicUrl" value="<%=p.getUrl() %>"/>
                <input hidden="hidden" type="text" name="musicLyric" value="<%=p.getLyric() %>"/>
                <button type='submit' class="btn btn-success" name='submit' ><i class="fa fa-play-circle-o" aria-hidden="true"></i></button>
            </form>
        </td>
        <td>
            <button type="button" class="btn btn-link" data-toggle="modal"
                    data-target="#modifyModal" data-whatever="<%=p.getID() %>">修改
            </button>
        </td>
        <td>
            <button type="button" class="btn btn-link"
                    onclick="window.location.href='ManageDeleteMusicServlet?MusicID=<%=p.getID() %>'">删除
            </button>
        </td>
    </tr>

    <%
            }
        }
    %>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>