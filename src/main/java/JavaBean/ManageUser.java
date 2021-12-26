package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ManageUser {

    public static void main(String[] args) throws Exception {
        ManageUser mu = new ManageUser();
        ArrayList<User> pl = mu.getUserList();
        User u = new User();
        u.setUserName("111");
        u.setUserPassword("111");
        u.setManager(false);
        mu.addUser(u);
    }

    //管理员管理用户

    //返回数据库中所有用户

    public ArrayList<User> getUserList() throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ArrayList<User> List = new ArrayList<User>();
        ResultSet rs = stmt.executeQuery("select * from user");
        while (rs.next()) {
            User p = new User();
            p.setUserName(rs.getString("username"));
            p.setUserPassword(rs.getString("userpassword"));
            p.setManager(rs.getBoolean("manager"));
            List.add(p);
        }
        conn.close();
        return List;
    }

    public boolean checkUser(User u) throws Exception {
        //判断用户名是否存在
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from user where username='" + u.getUserName() + "'");
        boolean bSuccess;
        bSuccess = rs.next();
        conn.close();
        return bSuccess;
    }


    //增加用户
    public void addUser(User u) throws Exception {

        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("INSERT INTO user(username,userpassword,manager) " + "VALUES ('" + u.getUserName() + "','" + u.getUserPassword() + "','" + u.isManager() + "')");
        conn.close();
    }

    //更新用户信息
    public void modifyUser(User u, String delName) throws Exception {
        //修改个人信息
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("UPDATE user SET username='" + u.getUserName() + "',userpassword='" + u.getUserPassword() + "'where  username='" + delName + "'");
        conn.close();
    }

    //删除用户
    public void deleteUser(User user) throws Exception {

        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("DELETE FROM user where username='" + user.getUserName() + "'");
        conn.close();
    }
}
