<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8");
    String oldname = request.getParameter("oldname");
%>
<!DOCTYPE html>
<html>
<head>
    <title>修改用户信息</title>
</head>


<form name='userModify' method='post' action='ManageModifyUserServlet'>

    <table>
        <tr>
            <font>[修改用户信息]</font><br>
        </tr>
        <tr>
            <td>
                <fron>用户名</fron>
            </td>
            <td>
                <fron>密码</fron>
            </td>
            <td>
                <fron>操作</fron>
            </td>
        </tr>
        <tr>
            <td><input name='userName' type='text'></td>
            <td><input name='userPassword' type='text'></td>
            <input name="oldname" type="hidden" value="<%=oldname %>"></td>
            <td><input type='submit' name='submit' value="提交"></td>

        </tr>

    </table>
</form>
<input type="button" name="managemusic" value="返回主界面" onclick="javascript:window.location.href='ManageMusic.jsp'"><br>
</body>
</html>