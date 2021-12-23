package JavaBean;

import java.sql.*;
import java.util.*;



public class ManageMusic {

		//把曲库全部查出
	    public ArrayList<Music> getmusicList() throws Exception   
	    {  
	        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	    	Connection conn=DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb");  	        
	    	Statement stmt = conn.createStatement();  
	    	ArrayList<Music> musicList = new ArrayList<Music>();
	        ResultSet rs = stmt.executeQuery("select * from music");  
	        while (rs.next()) {  
	        	Music p=new Music();
	        	p.setID(rs.getInt("ID"));
	            p.setTitle(rs.getString("title"));
	            p.setSinger(rs.getString("singer"));
	            p.setUrl(rs.getString("url"));
	            p.setLyricurl(rs.getString("lyricurl"));
	            p.setClass1(rs.getBoolean("class1"));
	            p.setClass2(rs.getBoolean("class2"));
	            p.setClass3(rs.getBoolean("class3"));
	            p.setClass4(rs.getBoolean("class4"));
	            musicList.add(p);
	        }  
	      conn.close();  
	      return musicList;
	    }  
	    
	    //按照关键字查找喜欢的歌曲
	    public ArrayList<Music> searchmusic(String keyword) throws Exception   
	    {  
	        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	    	Connection conn=DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb");  	        
	    	Statement stmt = conn.createStatement();  
	    	ArrayList<Music> musicList = new ArrayList<Music>();
	        ResultSet rs = stmt.executeQuery("select * from music where title like '%"+keyword+"%'");  
	        while (rs.next()) {  
	        	Music p=new Music();
	        	p.setID(rs.getInt("ID"));
	            p.setTitle(rs.getString("title"));
	            p.setSinger(rs.getString("singer"));
	            p.setUrl(rs.getString("url"));
	            p.setLyricurl(rs.getString("lyricurl"));
	            p.setClass1(rs.getBoolean("class1"));
	            p.setClass2(rs.getBoolean("class2"));
	            p.setClass3(rs.getBoolean("class3"));
	            p.setClass4(rs.getBoolean("class4"));
	            musicList.add(p);
	        }  
	      conn.close();  
	      return musicList;
	    }  
	    //添加歌曲
	     public void addmusic(Music u) throws Exception{        
		    	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		    	Connection conn=DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb"); 
		        
		    	Statement stmt = conn.createStatement();  
		    	stmt.executeUpdate("INSERT INTO music VALUES ('"+u.getTitle()+"', '"+u.getSinger()+"', '"+u.getUrl()+"', '"+u.getLyricurl()+"', '"+u.getUploader()+"')");
			    conn.close(); 
		       }
	     
	    //删除歌曲
		    public void deletemusic(Music u) throws Exception{
		    	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		    	Connection conn=DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb"); 	        
		    	Statement stmt = conn.createStatement();  
		    	stmt.executeUpdate("DELETE FROM music where ID='"+u.getID()+"'");
		    	//查询用户歌单中是否存在该歌，如果存在，从用户歌单中也删去该歌曲
		    	ResultSet rs = stmt.executeQuery("select * from mymusic where ID='"+u.getID()+"'"); 
		    	while(rs.next()) {
		    		stmt.executeUpdate("DELETE FROM mymusic where ID='"+u.getID()+"'");
		    	}
			    conn.close(); 
		       }
		    
		 //修改歌曲内容
		    public void modifymusic(Music u) throws Exception{
		    	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		    	Connection conn=DriverManager.getConnection("jdbc:ucanaccess://src//main//webapp//data//DataBase.accdb");    
		    	Statement stmt = conn.createStatement();  
		    	stmt.executeUpdate("UPDATE music SET title='"+u.getTitle()+"' , singer='"+u.getSinger()+"',class1='"+u.isClass1()+"',class2='"+u.isClass2()+"',class3='"+u.isClass3()+"',class4='"+u.isClass4()+"' where ID='"+u.getID()+"'");
		    	//查询用户歌单中是否存在该歌曲，如果存在，则一同修改
		    	ResultSet rs = stmt.executeQuery("select * from mymusic where ID='"+u.getID()+"'"); 
		    	while(rs.next()) {
		    		stmt.executeUpdate("UPDATE music SET title='"+u.getTitle()+"' , singer='"+u.getSinger()+"',class1='"+u.isClass1()+"',class2='"+u.isClass2()+"',class3='"+u.isClass3()+"',class4='"+u.isClass4()+"'  where ID='"+u.getID()+"'");
		    	}
		    	conn.close(); 
		       }
		    
		    public static void main(String args[]) throws Exception {  


		    }  
}
