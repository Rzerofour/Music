package JavaBean;

import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.Mp3File;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@SuppressWarnings("SqlNoDataSourceInspection")
public class PersonalManage {
    //用户管理信息与歌曲
    public static void main(String[] args) throws Exception {
        PersonalManage pm = new PersonalManage();
        User U = pm.getUserByName("admin");
        System.out.println(U.getUserName() + "，数据库链接成功！");
    }

    public User getUserByName(String name) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "'");
        rs.next();
        User u = new User();
        u.setUserName(rs.getString("username"));
        u.setUserPassword(rs.getString("userpassword"));
        conn.close();
        return u;
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

    public void deleteUser(User u) throws Exception {
        //注销账户与歌单
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("delete from user where username='" + u.getUserName() + "'");
        stmt.executeUpdate("delete from mymusic where owner='" + u.getUserName() + "'");
        conn.close();
    }

    public void modifyUser(User u, String delName) throws Exception {
        //修改个人信息
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("UPDATE user SET username='" + u.getUserName() + "',userpassword='" + u.getUserPassword() + "'where  username='" + delName + "'");
        stmt.executeUpdate("UPDATE mymusic SET owner='" + u.getUserName() + "'where  owner='" + delName + "' ");
        stmt.executeUpdate("UPDATE music SET uploader='" + u.getUserName() + "'where  uploader='" + delName + "' ");
        conn.close();
    }

    public ArrayList<Music> getMusicList() throws Exception {
        //查全部曲库
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ArrayList<Music> musicList = new ArrayList<Music>();
        ResultSet rs = stmt.executeQuery("select * from music");
        while (rs.next()) {
            Music p = new Music();
            p.setID(rs.getInt("ID"));
            p.setTitle(rs.getString("title"));
            p.setSinger(rs.getString("singer"));
            p.setUrl(rs.getString("url"));
            p.setLyric(rs.getString("lyric"));
            p.setClass1(rs.getBoolean("class1"));
            p.setClass2(rs.getBoolean("class2"));
            p.setClass3(rs.getBoolean("class3"));
            p.setClass4(rs.getBoolean("class4"));
            p.setUploader(rs.getString("uploader"));
            musicList.add(p);
        }
        conn.close();
        return musicList;
    }

    public ArrayList<MyMusic> getMyMusicList(String owner) throws Exception {
        //查全部歌单
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ArrayList<MyMusic> myMusicList = new ArrayList<MyMusic>();
        ResultSet rs = stmt.executeQuery("select * from mymusic  where owner='" + owner + "' ");
        while (rs.next()) {
            MyMusic p = new MyMusic();
            p.setID(rs.getInt("ID"));
            p.setOwner(rs.getString("owner"));
            p.setTitle(rs.getString("title"));
            p.setSinger(rs.getString("singer"));
            p.setUrl(rs.getString("url"));
            p.setLyric(rs.getString("lyric"));
            p.setClass1(rs.getBoolean("class1"));
            p.setClass2(rs.getBoolean("class2"));
            p.setClass3(rs.getBoolean("class3"));
            p.setClass4(rs.getBoolean("class4"));
            p.setLevel(rs.getInt("level"));
            myMusicList.add(p);
        }
        conn.close();
        return myMusicList;
    }

    public ArrayList<Music> searchMusic(String keyword) throws Exception {
        //按照关键字查找曲库
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ArrayList<Music> musicList = new ArrayList<Music>();
        ResultSet rs = stmt.executeQuery("select * from music where title like '%" + keyword + "%'");
        while (rs.next()) {
            Music p = new Music();
            p.setID(rs.getInt("ID"));
            p.setTitle(rs.getString("title"));
            p.setSinger(rs.getString("singer"));
            p.setUrl(rs.getString("url"));
            p.setLyric(rs.getString("lyric"));
            p.setClass1(rs.getBoolean("class1"));
            p.setClass2(rs.getBoolean("class2"));
            p.setClass3(rs.getBoolean("class3"));
            p.setClass4(rs.getBoolean("class4"));
            p.setUploader(rs.getString("uploader"));
            musicList.add(p);
        }
        conn.close();
        return musicList;
    }

    public ArrayList<MyMusic> searchMyMusic(String owner, String keyword) throws Exception {
        //按照关键字查找歌单
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ArrayList<MyMusic> myMusicList = new ArrayList<MyMusic>();
        ResultSet rs =
                stmt.executeQuery("select * from mymusic where owner='" + owner + "' and title like '%" + keyword +
                        "%'");
        while (rs.next()) {
            MyMusic p = new MyMusic();
            p.setID(rs.getInt("ID"));
            p.setOwner(rs.getString("owner"));
            p.setTitle(rs.getString("title"));
            p.setSinger(rs.getString("singer"));
            p.setUrl(rs.getString("url"));
            p.setLyric(rs.getString("lyric"));
            p.setClass1(rs.getBoolean("class1"));
            p.setClass2(rs.getBoolean("class2"));
            p.setClass3(rs.getBoolean("class3"));
            p.setClass4(rs.getBoolean("class4"));
            p.setLevel(rs.getInt("level"));
            myMusicList.add(p);
        }
        conn.close();
        return myMusicList;
    }

    public void uploadMusic(String fileName, String filePath, Music m, String uploader, User u) throws Exception {
        //上传歌曲
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        Mp3File mp3file = new Mp3File(filePath);
        if (mp3file.hasId3v2Tag()) {
            ID3v2 id3v2Tag = mp3file.getId3v2Tag();
            stmt.executeUpdate("INSERT INTO music(singer,title,url,class1,class2,class3,class4,uploader) VALUES ('" + id3v2Tag.getArtist() + "', " + "'" + id3v2Tag.getTitle() + "', '" + "music/" + fileName + "','" + m.isClass1() + "','" + m.isClass2() + "','" + m.isClass3() + "','" + m.isClass4() + "','" + uploader + "')");
            ResultSet rs = stmt.executeQuery("select * from music where title='" + id3v2Tag.getTitle() + "' and " +
                    "singer='" + id3v2Tag.getArtist() + "'");
            while (rs.next()) {
                stmt.executeUpdate("INSERT INTO mymusic(ID,owner,title,singer,url,class1,class2,class3,class4) " +
                        "VALUES" + " ('" + rs.getInt("ID") + "','" + u.getUserName() + "','" + id3v2Tag.getArtist() + "', " + "'" + id3v2Tag.getTitle() + "', '" + "music/" + fileName + "','" + m.isClass1() + "'," + "'" + m.isClass2() + "','" + m.isClass3() + "','" + m.isClass4() + "')");
            }
        }

        conn.close();
    }

    public void deleteMyMusic(MyMusic m, User u) throws Exception {
        //删除歌单歌曲
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("DELETE FROM mymusic where ID='" + m.getID() + "' and owner='" + u.getUserName() + "'");
        conn.close();
    }

    public void modifyMyMusic(User u, String level, MyMusic m) throws Exception {
        //修改歌曲评分
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("UPDATE mymusic SET level='" + level + "' where  owner='" + u.getUserName() + "'and ID='" + m.getID() + "'");
        conn.close();
    }

    public boolean checkMyMusic(User u, MyMusic music) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs =
                stmt.executeQuery("select * from mymusic where ID='" + music.getID() + "'and owner='" + u.getUserName() + "'");
        boolean bSuccess;
        bSuccess = rs.next();
        conn.close();
        return bSuccess;
    }

    public void addMyMusic(Music m, User u) throws Exception {
        //曲库存入歌单
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("INSERT INTO mymusic(ID,owner,title,singer,url,lyric,class1,class2,class3,class4) VALUES " + "('" + m.getID() + "','" + u.getUserName() + "','" + m.getTitle() + "', '" + m.getSinger() + "', '" + m.getUrl() + "', '" + m.getLyric() + "', '" + m.isClass1() + "', '" + m.isClass2() + "', '" + m.isClass3() + "', '" + m.isClass4() + "')");
        conn.close();
    }
}
