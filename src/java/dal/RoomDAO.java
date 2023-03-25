/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author LEGION 5
 */
public class RoomDAO extends DBContext {

    ResultSet rs;//luu tru va xu ly du lieu
    PreparedStatement pstm;//co the thuc hien giong stm
    
    public String getNameRoomById(String id){
        String nameRoom="";
        return nameRoom;
    }
}
