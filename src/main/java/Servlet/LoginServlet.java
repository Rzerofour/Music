package Servlet;

import JavaBean.MyMusic;
import JavaBean.PersonalManage;
import JavaBean.Register;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.util.ArrayList;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public LoginServlet() {
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
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            User u = new User();
            u.setUserName(userName);
            u.setUserPassword(userPassword);
            Register a = new Register();
            //PersonalManage music =new PersonalManage();
            boolean bsuccess;
            bsuccess = a.verifyUser(u);
            if (bsuccess) {
                if (a.judgeUser(u)) {
                    response.sendRedirect("ManageMusic.jsp?class=0");
                } else {
                    //HttpSession session = request.getSession();
                    //session.setAttribute("data", userName);
                    //String string=(String)request.getSession().getAttribute("data");
                    //ArrayList<MyMusic> list= music.getMyMusicList( string);
                    //request.setAttribute("list",list);
                    //request.getRequestDispatcher("/Test.jsp?class=0").forward(request,response);
                    response.sendRedirect("Test.jsp?class=0&user="+userName);

                }
            } else {
                PrintWriter out= response.getWriter();
                out.print("<script>alert('密码输入错误，请重新输入!');    window.location.href='Login.jsp'</script>");
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
