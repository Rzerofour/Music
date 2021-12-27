package Servlet;

import JavaBean.ManageMusic;
import JavaBean.Music;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

/**
 * Servlet implementation class ManageModifyMusicServlet
 */
public class ManageModifyMusicServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageModifyMusicServlet() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        try {
            response.setContentType("text/html");
            String title = request.getParameter("title");
            String singer = request.getParameter("singer");
            int ID = Integer.parseInt(request.getParameter("id"));
            Music m = new Music();
            m.setID(ID);
            m.setTitle(title);
            m.setSinger(singer);
            ManageMusic a = new ManageMusic();
            if (a.modifyCheck(m)) {
                PrintWriter out= response.getWriter();
                out.print("<script>alert('修改失败,修改值重复!');    window.location.href='ManageMusic.jsp?class=0'</script>");
            } else {
                a.modifyMusic(m);
                PrintWriter out= response.getWriter();
                out.print("<script>alert('修改成功!');    window.location.href='ManageMusic.jsp?class=0'</script>");
            }

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
