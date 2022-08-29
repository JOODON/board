package USER;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public userDAO() {
        try {
            String dburl="jdbc:mysql://localhost:3307/bbs";
            String dbID="root";
            String dbpassword="kkjjss103@";
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
    public List<user> getUser(){
        List<user> list=new ArrayList<>();
        String sql = "SELECT userID,userPassward,userName,userGender,userEmail FROM user order by userID desc";
        try {
            String dburl="jdbc:mysql://localhost:3307/bbs";
            String dbID="root";
            String dbpassword="kkjjss103@";
            Connection conn = DriverManager.getConnection(dburl, dbID, dbpassword);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                String userID=rs.getString(1);
                String userPassward= rs.getString(2);
                String userName=rs.getString(3);
                String userGender=rs.getString(4);
                String userEmail=rs.getString(5);
                user user=new user(userID,userPassward,userName,userGender,userEmail);
                list.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}

