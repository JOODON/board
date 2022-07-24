package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public userDAO() {
        try {
            String dburl="jdbc:mysql://localhost:3307/bbs";
            String dbID="root";
            String dbpassword="kkjjss103@";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dburl,dbID,dbpassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int login(String userID,String userPassward) {
        String SQL = "SELECT userPassward FROM USER WHERE userID=?";
        try {
            pstmt= conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs=pstmt.executeQuery();
            if (rs.next()){
                if(rs.getString(1).equals(userPassward)){
                    return 1;
                }
                else
                    return 0;
            }
            return -1;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return -2;
    }
    public int join(user user){
        String SQL="INSERT INTO USER VALUES(?,?,?,?,?) ";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2,user.getUserPassword());
            pstmt.setString(3,user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5,user.getUserEmail());
            return pstmt.executeUpdate();//받은값을 반환해주면서 실행
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}

