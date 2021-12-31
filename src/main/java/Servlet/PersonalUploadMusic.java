package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import JavaBean.*;
import JavaBean.PersonalManage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class UploadMusic
 */
public class PersonalUploadMusic extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "text/html;charset=utf-8");

		boolean music1 = Boolean.parseBoolean(request.getParameter("musicClass1"));
		boolean music2 = Boolean.parseBoolean(request.getParameter("musicClass2"));
		boolean music3 = Boolean.parseBoolean(request.getParameter("musicClass3"));
		boolean music4 = Boolean.parseBoolean(request.getParameter("musicClass4"));
		Music m = new Music();
		m.setClass1(music1);
		m.setClass2(music2);
		m.setClass3(music3);
		m.setClass4(music4);
		ManageMusic mm = new ManageMusic();
		String uploadPath = "C:\\Program Files\\apache-tomcat-10.0.8\\webapps\\Music\\music\\";
		try {
			final Collection<Part> parts = request.getParts();
			for (final Part part : parts) {
				if (part.getSubmittedFileName() != null) {
					part.write(uploadPath + part.getSubmittedFileName());
					boolean bsuccess;
					bsuccess = mm.checkMusic(uploadPath + part.getSubmittedFileName());
					if (bsuccess) {
						PrintWriter out = response.getWriter();
						out.print("<script>alert('数据库已经存在该文件!');    window.location.href='ManageMusic" + ".jsp?class" +
								"=0'</script>");
					} else {
						mm.uploadMusic(m, part.getSubmittedFileName(), uploadPath + part.getSubmittedFileName());
						PrintWriter out = response.getWriter();
						out.print("<script>alert('歌曲上传成功!');    window.location.href='ManageMusic" + ".jsp?class=0" +
								"'</script>");
					}
				}
			}
				
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
