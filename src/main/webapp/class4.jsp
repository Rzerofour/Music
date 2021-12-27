<%@ page language="java" contentType="text/html; charset=utf-8"
         import="JavaBean.*,java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
    <%

        ManageMusic a = new ManageMusic();
        ArrayList<Music> pl = a.getMusicList();
        for (Music p : pl) {
            if (p.isClass4()) {
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
