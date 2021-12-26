<%@ page language="java" contentType="text/html; charset=utf-8"
   import="JavaBean.*,java.util.*" pageEncoding="utf-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>管理用户</title>
</head>
<body>
	<input type="button" name="manageuser" value="用户管理" onclick="javascript:window.location.href='ManageUser.jsp'">
	<input type="button" name="managemusic" value="音乐管理" onclick="javascript:window.location.href='ManageMusic.jsp'">
<table >
	<h2>用户管理</h2>
<tr>
	<td><fron >用户名</fron></td>
	<td><fron >密码</fron></td>
	<td><fron >操作</fron></td>
</tr>
<jsp:useBean id="User" class="JavaBean.User">
<jsp:setProperty name="User" property="*"/>
</jsp:useBean>
<%
	ManageUser a=new ManageUser();
	ArrayList<User> pl=a.getUserList();
	for(User p:pl){
%>
<tr>
	<td ><%=p.getUserName() %></td>
	<td ><%=p.getUserPassword() %></td>
	<td><a href='ManageModifyUser.jsp?oldname=<%=p.getUserName() %>'>修改</a></td>	
	<td><a href='DeleteUserServlet?oldname=<%=p.getUserName() %>'>删除</a></td>	
</tr>
<%} %>
<tr >
	<td align='middle'></td>
	<td colspan='5' align='middle'>
	<a href='AddUser.jsp'>
	<font >新增用户</font>
	</a>
</tr>
</tr>
</table>
</body>
</html>