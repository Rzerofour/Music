package Servlet;

import JavaBean.ManageMusic;
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
        ManageMusic pm = new ManageMusic();
        String uploadPath = "C:\\Users\\Ahsilom\\eclipse-workspace\\Music\\src\\main\\webapp\\music\\";
        try {
            final Collection<Part> parts = request.getParts();
            for (final Part part : parts) {
                if (part.getSubmittedFileName() != null) {
                    part.write(uploadPath + part.getSubmittedFileName());
                }
                boolean bsuccess;
                bsuccess = pm.checkMusic(uploadPath + part.getSubmittedFileName());
                if (bsuccess) {
                    PrintWriter out= response.getWriter();
                    out.print("<script>alert('数据库已经存在该文件!');    window.location.href='ManageMusic.jsp'</script>");
                } else {
                    pm.uploadMusic(uploadPath + part.getSubmittedFileName());
                    PrintWriter out= response.getWriter();
                    out.print("<script>alert('歌曲上传成功!');    window.location.href='ManageMusic.jsp'</script>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


