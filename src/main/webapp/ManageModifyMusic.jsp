<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8");

%>
<%--DONE:已合并--%>
<!DOCTYPE html>
<html>
<head>
    <title>修改歌曲信息</title>
</head>


<form name='formModify' method='post' action='ManageModifyMusicServlet'>
    <table>
        <tr>
            <font>[修改音乐信息]</font><br>
        </tr>
        <tr>
            <td>
                <fron>ID</fron>
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
        <tr>
            <td><input name='id' type='text' value="<%=request.getParameter("MusicID")%>"></td>
            <td><input name='title' type='text'></td>
            <td><input name='singer' type='text'></td>
            <td><input type='submit' name='submit' value="提交"></td>
        </tr>

    </table>
</form>
<tr><input type="button" name="managemusic" value="返回主界面"
           onclick="javascript:window.location.href='ManageMusic.jsp'"><br>
</tr>
</body>
</html>