package JavaBean;

import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.Mp3File;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

//外部批量导入歌曲，与项目主体无关！
public class getID3 {
    public static void main(String[] args) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://E:\\DataBase.accdb");
        Statement stmt = conn.createStatement();
        File file = new File("src\\main\\webapp\\music");
        File[] fs = file.listFiles();
        for (File f : fs) {
            Mp3File mp3file = new Mp3File(f);
            if (mp3file.hasId3v2Tag()) {
                ID3v2 id3v2Tag = mp3file.getId3v2Tag();
                System.out.println(id3v2Tag.getArtist());
                System.out.println(id3v2Tag.getTitle());
                System.out.println(f.getName());

                stmt.executeUpdate("INSERT INTO music(singer,title,url,lyric,class4) VALUES ('" + id3v2Tag.getArtist() + "', '" + id3v2Tag.getTitle() + "', '" + "music/" + f.getName() + "', '" + id3v2Tag.getLyrics() + "','" + true + "')");
            }
        }
        conn.close();
    }
}
