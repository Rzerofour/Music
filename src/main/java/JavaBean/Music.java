package JavaBean;

public class Music {
    private int ID;
    private String title;
    private String singer;
    private String url;
    private String lyricurl;
    private boolean class1;
    private boolean class2;
    private boolean class3;
    private boolean class4;
    private String uploader;

    public int getID() {
        return ID;
    }
    public void setID(int iD) {
        ID = iD;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getSinger() {
        return singer;
    }
    public void setSinger(String singer) {
        this.singer = singer;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getLyricurl() {
        return lyricurl;
    }
    public void setLyricurl(String lyricurl) {
        this.lyricurl = lyricurl;
    }


    public boolean isClass1() {
        return class1;
    }
    public void setClass1(boolean class1) {
        this.class1 = class1;
    }
    public boolean isClass2() {
        return class2;
    }
    public void setClass2(boolean class2) {
        this.class2 = class2;
    }
    public boolean isClass3() {
        return class3;
    }
    public void setClass3(boolean class3) {
        this.class3 = class3;
    }
    public boolean isClass4() {
        return class4;
    }
    public void setClass4(boolean class4) {
        this.class4 = class4;
    }
    public String getUploader() {
        return uploader;
    }
    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

}
