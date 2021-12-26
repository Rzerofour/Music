package Servlet;

import java.io.IOException;
import JavaBean.PersonalManage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import JavaBean.User;
/**
 * Servlet implementation class DeleteUser
 */
public class DeleteMusicServlet extends HttpServlet {

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("UserName");
		PersonalManage pm =new PersonalManage();
		User user2=new User();
		try {
			user2=pm.getUserByName(id);
	        //pm.deleteMyMusic(UserName,user2);
	        request.getRequestDispatcher("/MusicManage").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
