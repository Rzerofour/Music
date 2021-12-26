package Servlet;

import JavaBean.PersonalManage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "Servlet", value = "/Servlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String uploadPath = "D:\\ecilise\\workplace\\Music\\src\\main\\webapp\\music\\";
        PersonalManage pm = new PersonalManage();
        try {
            final Collection<Part> parts = request.getParts();
            for (final Part part : parts) {
                if (part.getSubmittedFileName() != null) {
                    part.write(uploadPath + part.getSubmittedFileName());
                }
                pm.uploadMusic(pm.getUserByName("admin"), uploadPath + part.getSubmittedFileName());
            }
            response.getWriter().print("The file has been uploaded successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
