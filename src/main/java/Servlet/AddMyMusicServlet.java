package Servlet;

import JavaBean.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class AddMyMusicServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "text/html;charset=utf-8");
        int i = Integer.parseInt(request.getParameter("MusicID"));
        Music mymusic = new Music();
        MyMusic m = new MyMusic();
        User user = new User();

        String name = request.getParameter("user");
        user.setUserName(name);

        m.setID(i);

        ManageMusic mm = new ManageMusic();

        PersonalManage pm = new PersonalManage();
        try {
            mymusic = mm.getMusicByID(i);
            if (pm.checkMyMusic(user, m)) {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('该歌曲已存在于歌单!');    window.location.href='GetMusic.jsp?class=0&user=" + name +
						"'</script>");
			}
		 else{
                    pm.addMyMusic(mymusic, user);
				PrintWriter out = response.getWriter();
				out.print("<script>alert('收藏成功!');    window.location.href='GetMusic.jsp?class=0&user=" + name +
						"'</script>");
                }
            } catch(Exception e){
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);}

    }
