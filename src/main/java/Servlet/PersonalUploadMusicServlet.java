package Servlet;


import JavaBean.ManageMusic;
import JavaBean.Music;
import JavaBean.PersonalManage;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

/**
 * Servlet implementation class ManageUploadMusicServlet
 */
@MultipartConfig
public class PersonalUploadMusicServlet extends HttpServlet {


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "text/html;charset=utf-8");
        int up = Integer.parseInt(request.getParameter("up"));
        String name = request.getParameter("name");
        User user1 = new User();
        user1.setUserName(name);
        boolean music1 = Boolean.parseBoolean(request.getParameter("musicClass1"));
        boolean music2 = Boolean.parseBoolean(request.getParameter("musicClass2"));
        boolean music3 = Boolean.parseBoolean(request.getParameter("musicClass3"));
        boolean music4 = Boolean.parseBoolean(request.getParameter("musicClass4"));

        Music m = new Music();
        m.setClass1(music1);
        m.setClass2(music2);
        m.setClass3(music3);
        m.setClass4(music4);
        PersonalManage pmusic = new PersonalManage();
        ManageMusic pm = new ManageMusic();
        String uploadPath = "C:\\Program Files\\apache-tomcat-10.0.8\\webapps\\Music\\music\\";
        String uploader;
        if (up == 1) {
            uploader = "";
        } else {
            uploader = name;
        }
        try {
            final Collection<Part> parts = request.getParts();
            for (final Part part : parts) {
                if (part.getSubmittedFileName() != null) {
                    part.write(uploadPath + part.getSubmittedFileName());
                    boolean bsuccess;
                    bsuccess = pm.checkMusic(uploadPath + part.getSubmittedFileName());
                    if (bsuccess) {
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('数据库已经存在该文件!');    window.location.href='ManageMusic" + ".jsp?class" +
                                "=0'</script>");
                    } else {
                        pmusic.uploadMusic(part.getSubmittedFileName(),uploadPath + part.getSubmittedFileName(), m, uploader, user1);

                        //pmusic.uploadMyMusic( part.getSubmittedFileName(), uploadPath + part.getSubmittedFileName(),m);
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('歌曲上传成功!');    window.location.href='ManageMusic" + ".jsp?class=0" +
                                "'</script>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}




