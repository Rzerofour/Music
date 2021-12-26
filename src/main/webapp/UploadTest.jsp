<%--
  Created by IntelliJ IDEA.
  User: Ahsilom
  Date: 2021/12/24
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="Servlet" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td></td>
            <td><h1>文件上传</h1></td>
        </tr>
        <tr>
            <td>上传文件:</td>
            <td><input type="file" name="file"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="上传文件"/></td>
        </tr>
    </table>
</form>
</body>
</html>
