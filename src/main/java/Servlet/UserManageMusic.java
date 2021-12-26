package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import JavaBean.MyMusic;
import JavaBean.PersonalManage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MusicManage
 */
public class UserManageMusic extends HttpServlet {

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PersonalManage music =new PersonalManage();
				ArrayList<MyMusic> list= music.getMyMusicList();
				
				request.setAttribute("list",list);
				request.getRequestDispatcher("/MusicManage.jsp").forward(request,response);
			} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
		}
	}

}
