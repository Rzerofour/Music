package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@SuppressWarnings("SqlNoDataSourceInspection")
public class testDB {

    public static void main(String[] args) throws Exception {
        testDB db = new testDB();
//    	ArrayList<Product> pl= dc.getProductList();
//    	System.out.println(pl.get(2).getName());
        User U = db.getUserByName("admin");
        System.out.println(U.getUserName() + "，数据库链接成功！");
    }

    public User getUserByName(String name) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//UserDB.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from usertable where username='" + name + "'");
        rs.next();
        User u = new User();
        u.setUserName(rs.getString("username"));
        u.setUserPassword(rs.getString("userpwd"));
        conn.close();
        return u;
    }
}
