package USER;

public class user {
    private String userID;
    private String userPassword;
    private String userName;
    private String userGender;
    private String userEmail;

    public user(String userID, String userPassward, String userName, String userGender, String userEmail) {
        super();
        this.userID = userID;
        this.userPassword = userPassword;
        this.userName = userName;
        this.userGender = userGender;
        this.userEmail = userEmail;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassward) {
        this.userPassword = userPassward;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
