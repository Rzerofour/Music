package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import JavaBean.MyMusic;
import JavaBean.PersonalManage;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
public class PersonalDeleteMyMusicServlet extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
      PersonalManage pm=new PersonalManage();
      MyMusic music =new MyMusic();
      User user=new User();
     music.setID(Integer.parseInt(request.getParameter("id")));
	  user.setUserName(request.getParameter("owner"));
		try {
			pm.deleteMyMusic(music,user );
			PrintWriter out= response.getWriter();
			out.print("<script>alert('删除成功!');    window.location.href='ManageMusic.jsp?class=0'</script>");
			//request.getRequestDispatcher("/MusicManage").forward(request,response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
}
