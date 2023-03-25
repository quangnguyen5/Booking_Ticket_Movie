/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Cinema;

/**
 *
 * @author LEGION 5
 */
public class CinemaDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;
    
    public  ArrayList<Cinema> getListCinemaByCityId(String cityId){
        ArrayList<Cinema> listCinema = new ArrayList<>();
        try {
            String sql = "select * from Cinema where CityID = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, cityId);
            rs = pstm.executeQuery();
            while (rs.next()) {                
                listCinema.add(new Cinema(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
            System.out.println("get list ok");
        } catch (Exception e) {
            System.out.println("get list Cinema error: " + e.getMessage());
        }
        return listCinema;
    }
    
    public String getNameCinemaById(String id){
        String cinemaName = "";
        try {
            String sql = "select * from Cinema where ID = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                cinemaName = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("get cinema error: " + e.getMessage());
        }
        return cinemaName;
    }
}
