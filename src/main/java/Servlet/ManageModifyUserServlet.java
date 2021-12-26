package Servlet;

import JavaBean.ManageUser;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class ManageModifyUserServlet
 */
public class ManageModifyUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageModifyUserServlet() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub

        try {
            response.setContentType("text/html");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String oldname = request.getParameter("oldname");
            User u = new User();
            u.setUserName(userName);
            u.setUserPassword(userPassword);
            ManageUser a = new ManageUser();
            boolean bsuccess;
            bsuccess = a.checkUser(u);
            if (bsuccess) {
                response.getWriter().print("用户名已存在，请重新输入");
                response.setHeader("Refresh", "3;url=ManageModifyUser.jsp");
            } else {
                a.modifyUser(u, oldname);
                response.getWriter().print("The User has been modified successfully.");
                response.setHeader("Refresh", "3;url=ManageUser.jsp");
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}


