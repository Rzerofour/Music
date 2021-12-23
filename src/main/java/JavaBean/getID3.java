package JavaBean;

import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.Mp3File;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class getID3 {
    public static void main(String[] args) throws Exception {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        Connection conn = DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb");
        Statement stmt = conn.createStatement();
        String str="OPEN";
        File file = new File("C:\\Users\\Ahsilom\\eclipse-workspace\\Music\\src\\main\\webapp\\music");
        File[] fs = file.listFiles();
        for (File f : fs) {
            Mp3File mp3file = new Mp3File(f);
            if (mp3file.hasId3v2Tag()) {
                ID3v2 id3v2Tag = mp3file.getId3v2Tag();
                //System.out.println(id3v2Tag.getArtist());
                //System.out.println(id3v2Tag.getTitle());
                stmt.executeUpdate("INSERT INTO music(singer,title,url,uploader) VALUES ('"+id3v2Tag.getArtist()+"', " +
                        "'"+id3v2Tag.getTitle()+"', '"+f+"', '"+str+"')");
            }
        }
        conn.close();
    }
}
