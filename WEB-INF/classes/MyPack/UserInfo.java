package MyPack;

import java.io.Serializable;

public class UserInfo implements Serializable{
    private String Uname;
    private int Uage;
    private String Upassword;
    private String Uemail;
    private boolean isAdmin;
    private int Id;

    public UserInfo() {
        Uname = "";
        Uage = 0;
        Upassword = "";
        Uemail = "";
        isAdmin = false;
    }

    // setters
    public void setUname(String Uanme) {
        this.Uname = Uanme;
    }

    public void setUage(int Uage) {
        this.Uage = Uage;
    }

    public void setUpassword(String Upassword) {
        this.Upassword = Upassword;
    }

    public void setUemail(String Uemail) {
        this.Uemail = Uemail;
    }

    public void setIsAdmin(boolean t){
        this.isAdmin = t;
    }

    public void setId(int Id){
        this.Id = Id;
    }

    // getters
    public String getUname() {
        return Uname;
    }

    public int getUage() {
        return Uage;
    }

    public String getUpassword() {
        return Upassword;
    }

    public String getUemail() {
        return Uemail;
    }
    public boolean getIsAdmin(){
        return isAdmin;
    }
    public int getId(){
        return Id;
    }
}