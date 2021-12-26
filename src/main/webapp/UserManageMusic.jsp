<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> here2</title>
</head>
<body>
<table align="center"  border="1"cellspacing="0" cellpadding="5">
<tr>
      <td colspan="7">
      <input type="button" value="删除歌曲" onclick="delete()"> </td>
</tr>
       <tr>
          <th>dcd</th>
          <th>歌曲名</th>
          <th>歌手</th>
          <th>歌手</th>
          <th>歌手</th>
          <th>歌手</th>
          <th>歌手</th>
          <th>歌手</th>
          <th>歌手</th>
        </tr>
<c:if test="${not empty list }">
     <c:forEach items="${list }" var="music" varStatus="s">
     <tr>
          <td>${music.ID }</td>
          <td>${music.title }</td>
          <td>${music.singer }</td>
          <td>${music.url }</td>
          <td>${music.lyricurl }</td>
          <td>${music.class1 }</td>
          <td>${music.class2 }</td>
          <td>${music.class3 }</td>
          <td>${music.class4 }</td>
          <td><a href="#">修改</a><a href="DeleteUser?id=${user.UserName }">删除</a>
        </tr>
   </c:forEach>
   </c:if></table>
   
</body>
</html>