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


/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddUserServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		    response.setContentType("text/html");
			String userName=request.getParameter("userName");
			String userPassword=request.getParameter("userPassword");
			String[] man =request.getParameterValues("manager");
			boolean manager;
			manager= man[0].equals("是");
			if(manager){
				String key=request.getParameter("key");
				if(key.equals("音乐管理")){
					User u=new User();
					u.setUserName(userName);
					u.setUserPassword(userPassword);
					u.setManager(true);
					ManageUser a=new ManageUser();
					Register b=new Register();
					boolean bsuccess;
					bsuccess=a.checkUser(u);
					if(bsuccess){
						PrintWriter out= response.getWriter();
						out.print("<script>alert('用户名已存在，请重新输入!');    window.location.href='AddUser.jsp'</script>");
					}
					else {
						b.addUser(u);
						PrintWriter out= response.getWriter();
						out.print("<script>alert('注册成功!');    window.location.href='ManageUser.jsp'</script>");
					}
				}
				else {
					PrintWriter out= response.getWriter();
					out.print("<script>alert('密钥错误，请重新输入!');    window.location.href='AddUser.jsp'</script>");
				}
			}
			else {
				User u=new User();
				u.setUserName(userName);
				u.setUserPassword(userPassword);
				u.setManager(false);
				ManageUser a=new ManageUser();
				Register b=new Register();
				boolean bsuccess;
				bsuccess=a.checkUser(u);
				if(bsuccess){
					PrintWriter out= response.getWriter();
					out.print("<script>alert('用户名已存在，请重新输入!');    window.location.href='AddUser.jsp'</script>");
				}
				else {
					b.addUser(u);
					PrintWriter out= response.getWriter();
					out.print("<script>alert('注册成功!');    window.location.href='ManageUser.jsp'</script>");
				}
			}
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
