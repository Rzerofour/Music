package Servlet;

import JavaBean.ManageMusic;
import JavaBean.Music;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ManageDeleteMusicServlet
 */
public class ManageDeleteMusicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageDeleteMusicServlet() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");
        int ID = Integer.parseInt(request.getParameter("MusicID"));
        Music m = new Music();
        m.setID(ID);
        ManageMusic a = new ManageMusic();
        try {
            a.deleteMusic(m);
            PrintWriter out= response.getWriter();
            out.print("<script>alert('删除成功!');    window.location.href='ManageMusic.jsp?class=0'</script>");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
