package Servlet;

import JavaBean.MyMusic;
import JavaBean.PersonalManage;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class UpdateMusicLevelServlet
 */
public class UpdateMusicLevelServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        response.setContentType("text/html");
        String level = request.getParameter("level");
        String name = request.getParameter("name");
        int ID = Integer.parseInt(request.getParameter("id"));
        MyMusic mymusic = new MyMusic();
        mymusic.setID(ID);
        User user = new User();
        user.setUserName(name);
        PersonalManage pm = new PersonalManage();
        try {
            pm.modifyMyMusic(user, level, mymusic);
            PrintWriter out = response.getWriter();
            out.print("<script>alert('评分修改成功!');    window.location.href='PersonalManage.jsp?class=0&user=" + name +
                    "'</script>");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
