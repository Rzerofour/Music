<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--DONE:已合并--%>
<html>
<head>
    <title>歌曲上传</title>
</head>
<body>
<form action="ManageUploadMusicServlet" method="post" enctype="multipart/form-data">
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
            <td> <input type="button" name="managemusic" value="返回主界面" onclick="javascript:window.location.href='ManageMusic.jsp'"></td>
            <td><input type="submit" value="上传文件"/></td>
           
        </tr>
    </table>
</form>



</body>
</html>