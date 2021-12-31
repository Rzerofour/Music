package Servlet;

import JavaBean.ManageUser;
import JavaBean.Register;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.util.ArrayList;

/**
 * Servlet implementation class DeleteUserServlet
 */
public class ManageDeleteUserServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public ManageDeleteUserServlet() {
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
                    PrintWriter out= response.getWriter();
                    out.print("<script>alert('删除失败，请至少保留一位管理员!');    window.location.href='ManageUser.jsp'</script>");
                } else {
                    a.deleteUser(u);
                    PrintWriter out= response.getWriter();
                    out.print("<script>alert('删除成功!');    window.location.href='ManageUser.jsp'</script>");
                }
            } else {
                a.deleteUser(u);
                PrintWriter out= response.getWriter();
                out.print("<script>alert('删除成功!');    window.location.href='ManageUser.jsp'</script>");
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
