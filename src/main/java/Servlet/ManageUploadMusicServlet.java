package Servlet;

import JavaBean.ManageMusic;
import JavaBean.Music;
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
public class ManageUploadMusicServlet extends HttpServlet {


    /**
     * Default constructor.
     */
    public ManageUploadMusicServlet() {
        // TODO Auto-generated constructor stub
    }

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
                        out.print("<script>alert('数据库已经存在该文件!');    window.location.href='ManageMusic" + ".jsp?class" + "=0'</script>");
                    } else {
                        mm.uploadMusic(m, part.getSubmittedFileName(), uploadPath + part.getSubmittedFileName());
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('歌曲上传成功!');    window.location.href='ManageMusic" + ".jsp?class=0" + "'</script>");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


