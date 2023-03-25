/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Bill;
import model.Cinema;

/**
 *
 * @author LEGION 5
 */
public class BillDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;
    
    public ArrayList<Bill> getListBill(){
        ArrayList<Bill> listBill = new ArrayList<>();
        try {
            String sql = "select * from Bill";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {                
                listBill.add(new Bill(rs.getString(1), rs.getString(2), rs.getDate(3).toLocalDate(), rs.getString(4)));
            }
            System.out.println("get list ok");
        } catch (Exception e) {
            System.out.println("get list bill error: " + e.getMessage());
        }
        return listBill;
    }
    
    public boolean insertIntoBill(String startTime, String date, String seatId) {
        try {
            String sql = "insert into Bill(StartTime,Date,SeatId) values(?,?,?)";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, startTime);
            pstm.setString(2, date);
            pstm.setString(3, seatId);
            pstm.executeUpdate();
            System.out.println("insert bill ok");
            return true;
        } catch (Exception e) {
            System.out.println("insert bill error: " + e.getMessage());
        }
        return false;
    }
}
