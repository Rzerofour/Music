package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Register {
    //用户注册

    public static void main(String[] args) throws Exception {
        Register re = new Register();
        User user = new User();
        user.setUserName("wzna");
        user.setUserPassword("555");
        user.setManager(true);
        re.addUser(user);

    }

    public boolean verifyUser(User u) throws Exception {
        //登录验证
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from user where username='" + u.getUserName() + "' and " +
                "userpassword='" + u.getUserPassword() + "'");
        boolean bSuccess;
        bSuccess = rs.next();
        conn.close();
        return bSuccess;
    }

    //判断登录者是管理员还是普通用户
    public boolean judgeUser(User u) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select manager from user where ID='" + u.getID() + "'");
        boolean bSuccess;
        bSuccess = rs.next();
        conn.close();
        return bSuccess;
    }

    public void addUser(User u) throws Exception {

        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("INSERT INTO user(username,userpassword,manager) " + "VALUES ('" + u.getUserName() + "','" + u.getUserPassword() + "','" + u.isManager() + "')");
        conn.close();
    }
}
