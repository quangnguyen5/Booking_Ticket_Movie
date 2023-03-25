/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Seat;

/**
 *
 * @author LEGION 5
 */
public class SeatDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Seat> getListSeat() {
        ArrayList<Seat> listSeat = new ArrayList<>();
        try {
            String sql = "select * from Seat";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listSeat.add(new Seat(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println("insert seat error: " + e.getMessage());
        }
        return listSeat;
    }

    public boolean importIntoSeat(String id, String movieId, String roomId, String userId, String index) {
        try {
            String sql = "insert into Seat values(?,?,?,?,?)";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, movieId);
            pstm.setString(3, roomId);
            pstm.setString(4, userId);
            pstm.setString(5, index);
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("insert list error: " + e.getMessage());
        }
        return false;
    }

    public ArrayList<Seat> getListSeatBooked(String userId, String roomId, String moviedId) {
        ArrayList<Seat> listSeat = new ArrayList<>();
        try {
            String sql = "select * from Seat where userId = ? and roomId = ? and movieId = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, userId);
            pstm.setString(2, roomId);
            pstm.setString(3, moviedId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listSeat.add(new Seat(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println("get seat error: " + e.getMessage());
        }
        return listSeat;
    }

    public ArrayList<String> getListSeatSelected(String userId, String movieId, String roomId) {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "Select s.[Index] From Seat s Where MovieId = ? and RoomId = ? and UserId = ?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, movieId);
            pstm.setString(2, roomId);
            pstm.setString(3, userId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
            System.out.println("get list seat error: " + e.getMessage());
        }
        return list;
    }
}
