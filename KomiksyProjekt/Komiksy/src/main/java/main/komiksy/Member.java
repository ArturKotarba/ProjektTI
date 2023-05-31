package main.komiksy;

public class Member {

    private String uname, password, email, phone;

    private String permission = "null";
    public Member() {
        super();
    }

    public Member(String uname, String password, String email, String phone, String permission) {
        super();
        this.uname = uname;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.permission = permission;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getPermission()
    {
        System.out.println("permission: " + permission);
        return permission;
    }

}





