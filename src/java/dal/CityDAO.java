/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.City;

/**
 *
 * @author LEGION 5
 */
public class CityDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;
    
    public ArrayList<City> getListCity(){
        ArrayList<City> listCity = new ArrayList<>();
        try {
            String sql = "select * from City";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while(rs.next()){
                listCity.add(new City(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            System.out.println("get list city error: " + e.getMessage());
        }
        return listCity;
    }
    
    public String getNameCityById(String id){
        String cityName = "";
        try {
            String sql = "select * from City where ID = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                cityName = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("get city error: " + e.getMessage());
        }
        return cityName;
    }
}
