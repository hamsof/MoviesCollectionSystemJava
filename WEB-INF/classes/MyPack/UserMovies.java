package MyPack;

import java.io.Serializable;

public class UserMovies implements Serializable {
    private String mName;
    private int id;
    private String description;
    private int Mid;

    public UserMovies() {
        mName = "";
        description = "";
        id = 0;
        Mid = 0;
    }

    public void setMname(String mName) {
        this.mName = mName;

    }

    public void setDescription(String description) {
        this.description = description;

    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMid(int Mid) {
        this.Mid = Mid;
    }

    public String getMname() {
        return mName;
    }

    public String getDescription() {
        return description;
    }

    public int getId() {
        return id;
    }
    public int getMid(){
        return Mid;
    }
    public String toString(){
        return getId() + " " + getMid() + " " + getMname()+ " " + getDescription() ; 
    }
}