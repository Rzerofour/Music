package JavaBean;

import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.Mp3File;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@SuppressWarnings("SqlNoDataSourceInspection")
public class ManageMusic {
    //管理员管理音乐

    public Music getMusicByID(int id) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from music where ID='" + id + "'");
        rs.next();
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
        conn.close();
        return p;
    }


    //把曲库全部查出
    public ArrayList<Music> getMusicList() throws Exception {
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
            musicList.add(p);
        }
        conn.close();
        return musicList;
    }

    //按照关键字查找歌曲
    public ArrayList<Music> searchMusic(String keyword) throws Exception {
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
            musicList.add(p);
        }
        conn.close();
        return musicList;
    }

    //判断歌曲是否已经存在于数据库
    public boolean checkMusic(String fileName) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        Mp3File mp3file = new Mp3File(fileName);
        boolean bsuccess;
        if (mp3file.hasId3v2Tag()) {
            ID3v2 id3v2Tag = mp3file.getId3v2Tag();
            ResultSet rs = stmt.executeQuery("select * from music where title='" + id3v2Tag.getTitle() + "' and " +
                    "singer='" + id3v2Tag.getArtist() + "'");
            bsuccess = rs.next();
            return bsuccess;
        } else {
            return false;
        }
    }

    //添加歌曲
    public void uploadMusic(String fileName,String filePath) throws Exception {

        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        Mp3File mp3file = new Mp3File(filePath);
        if (mp3file.hasId3v2Tag()) {
            ID3v2 id3v2Tag = mp3file.getId3v2Tag();
            stmt.executeUpdate("INSERT INTO music(singer,title,url,lyric) VALUES ('" + id3v2Tag.getArtist() + "', " +
                    "'" + id3v2Tag.getTitle() + "', '" + "music/" +fileName +"', '" + id3v2Tag.getLyrics() +"')");
        }

        conn.close();
    }

    //删除歌曲
    public void deleteMusic(Music u) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("DELETE FROM music where ID='" + u.getID() + "'");
        //查询用户歌单中是否存在该歌，如果存在，从用户歌单中也删去该歌曲
        ResultSet rs = stmt.executeQuery("select * from mymusic where ID='" + u.getID() + "'");
        while (rs.next()) {
            stmt.executeUpdate("DELETE FROM mymusic where ID='" + u.getID() + "'");
        }
        conn.close();
    }

    //修改歌曲判断是否歌曲名和歌手名重复
    public boolean modifyCheck(Music u) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        boolean bsuccess;
        ResultSet rs =
                stmt.executeQuery("select * from music where title='" + u.getTitle() + "' and singer='" + u.getSinger() + "'");
        bsuccess = rs.next();
        return bsuccess;
    }

    //修改歌曲内容
    public void modifyMusic(Music u) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("UPDATE music SET title='" + u.getTitle() + "' , singer='" + u.getSinger() + "',class1='" + u.isClass1() + "',class2='" + u.isClass2() + "',class3='" + u.isClass3() + "',class4='" + u.isClass4() + "' where ID='" + u.getID() + "'");
        //查询用户歌单中是否存在该歌曲，如果存在，则一同修改
        ResultSet rs = stmt.executeQuery("select * from mymusic where ID='" + u.getID() + "'");
        while (rs.next()) {
            stmt.executeUpdate("UPDATE music SET title='" + u.getTitle() + "' , singer='" + u.getSinger() + "',class1"
                    + "='" + u.isClass1() + "',class2='" + u.isClass2() + "',class3='" + u.isClass3() + "',class4='" + u.isClass4() + "'  where ID='" + u.getID() + "'");
        }
        conn.close();
    }

    public static void main(String args[]) throws Exception {


    }
}
