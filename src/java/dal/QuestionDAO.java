/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author LEGION 5
 */
public class QuestionDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Question> getListQuestion() {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "Select * from Question where id = 1";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println("eror" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Question> getListAnswer() {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "select A,B,C,D from Question";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            rs = pstm.executeQuery();
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Question> getListResult(String A) {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "select * from Question where Answer = ? where id = 2";

            pstm = connection.prepareStatement(sql);
            pstm.setString(1, A);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            rs = pstm.executeQuery();
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Question> getListQuestion1() {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "Select * from Question where id = 2";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println("eror" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Question> getListQuestion2() {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "Select * from Question where id = 3";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println("eror" + e.getMessage());
        }
        return list;
    }

}
