package USER;

import java.util.List;

public class allUser {
    public static void main(String[] args) {
        userDAO userDAO=new userDAO();

        List<user> list=userDAO.getUser();
        for (user user : list){
            System.out.println(user);
        }
    }
}
