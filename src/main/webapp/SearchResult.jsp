<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
    <%
        String word = request.getParameter("partname");
        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.searchMusic(word);
        for (Music p : pl) {
    %>
    <tr>
        <td><%=p.getID() %>
        </td>
        <td><%=p.getTitle() %>
        </td>
        <td><%=p.getSinger() %>
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

    <%} %>