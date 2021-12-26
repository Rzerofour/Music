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
public class UserUpload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String uploadPath = "C:\\Users\\Ahsilom\\eclipse-workspace\\Music\\src\\main\\webapp\\music\\";
        //FIXME:每个人的地址不一样
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
