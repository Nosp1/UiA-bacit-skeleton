package bacit.web.bacit_models;

public class RegisterUserModel {
    private String fullName;
    private String phoneNumber;
    private String eMail;
    private Boolean fagforbund;
    private String userName;
    private String password;

    public String getFullName() { return fullName; }

    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhoneNumber() { return phoneNumber; }

    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String geteMail() { return eMail; }

    public void seteMail(String eMail) { this.eMail = eMail; }

    public Boolean getFagforbund() { return fagforbund; }

    public void setFagforbund(Boolean fagforbund) { this.fagforbund = fagforbund; }

    public String getUserName() { return userName; }

    public void setUserName(String userName) { this.userName = userName; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }
}

