package Servlet;

import JavaBean.ManageUser;
import JavaBean.PersonalManage;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


/**
 * Servlet implementation class LogoutServlet
 */
public class PersonalDeleteSelfServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("text/html");
		String oldName = request.getParameter("oldName");
		User u = new User();
		u.setUserName(oldName);
        PersonalManage pm = new PersonalManage();
        try {
            pm.deleteUser(u);
			PrintWriter out= response.getWriter();
			out.print("<script>alert('删除成功!');    window.location.href='Login.jsp'</script>");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		doGet(request, response);
	}
}
