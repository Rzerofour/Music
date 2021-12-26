package Servlet;

import JavaBean.ManageUser;
import JavaBean.Register;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.util.ArrayList;

/**
 * Servlet implementation class DeleteUserServlet
 */
public class DeleteUserServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public DeleteUserServlet() {
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
            String oldName = request.getParameter("oldName");
            User u = new User();
            u.setUserName(oldName);
            Register re = new Register();
            boolean judge = re.judgeUser(u);
            ManageUser a = new ManageUser();
            if (judge) {

                ArrayList<User> pl = a.getManagerList();
                int number = 0;
                for (User m : pl) {
                    number++;
                }
                if (number == 1) {
                    response.getWriter().print("管理员数量为1，不可继续删除");
                    response.setHeader("Refresh", "3;url=ManageUser.jsp");
                } else {
                    a.deleteUser(u);
                    response.getWriter().print("The User has been deleted.");
                    response.setHeader("Refresh", "3;url=ManageUser.jsp");
                }
            } else {
                a.deleteUser(u);
                response.getWriter().print("The User has been deleted.");
                response.setHeader("Refresh", "3;url=ManageUser.jsp");
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
