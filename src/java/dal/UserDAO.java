/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Users;

/**
 *
 * @author LEGION 5
 */
public class UserDAO extends DBContext {

    ResultSet rs;//luu tru va xu ly du lieu
    PreparedStatement pstm;//co the thuc hien giong stm

    public Users getAccountUser(String email, String password) {
        try {
            String sql = "select * from dbo.[Users] where Email = ? and Password = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
            System.out.println("Login ok!");
        } catch (Exception e) {
            System.out.println("Login error: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<Users> getListUser() {
        ArrayList<Users> listUser = new ArrayList<>();
        try {
            String sql = "select * from dbo.[Users]";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listUser.add(new Users(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println("Get list user error: " + e.getMessage());
        }
        return listUser;
    }

    public boolean register(String userId, String name, String email, String passwd, String phone) {
        try {
            String sql = "INSERT INTO Users(UserId, Name, Email, Password, Phone) VALUES (?,?,?,?,?)";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, userId);
            pstm.setString(2, name);
            pstm.setString(3, email);
            pstm.setString(4, passwd);
            pstm.setString(5, phone);
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Register error: " + e.getMessage());
        }
        return false;
    }
    
    public String getNameUserById(String id){
        String userName = "";
        try {
            String sql = "select * from Users where UserId = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                userName = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("get user error: " + e.getMessage());
        }
        return userName;
    }

}
