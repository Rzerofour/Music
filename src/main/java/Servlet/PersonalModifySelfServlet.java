package Servlet;

import JavaBean.PersonalManage;
import JavaBean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class PersonalModifySelfServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        try {
            response.setContentType("text/html");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String oldName = request.getParameter("oldName");
            User u = new User();
            u.setUserName(userName);
            u.setUserPassword(userPassword);
            PersonalManage a = new PersonalManage();
            boolean bsuccess;
            bsuccess = a.checkUser(u);
            if (bsuccess) {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('用户名已存在，请重新输入!');    window.location.href='PersonalManage.jsp?class=0&user=" + oldName + "'</script>");
            } else {
                a.modifyUser(u, oldName);
                PrintWriter out = response.getWriter();
                out.print("<script>alert('修改成功!');    window.location.href='PersonalManage" +
                        ".jsp?class=0&user=" + userName + "'</script>");
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

}