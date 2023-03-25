/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Movie;

/**
 *
 * @author LEGION 5
 */
public class MovieDAO extends DBContext {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Movie> getListTop4MovieByGenre(String genre) {
        ArrayList<Movie> listMovie = new ArrayList<>();
        try {
            String sql = "select top 4 * from Movie where Genre like ? order by ReleaseDate DESC";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, "%" + genre + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                listMovie.add(new Movie(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
            System.out.println("get list done!");
        } catch (Exception e) {
            System.out.println("get list movie error: " + e.getMessage());
        }
        return listMovie;
    }

    public ArrayList<Movie> getListTop4Movie() {
        ArrayList<Movie> listMovie = new ArrayList<>();
        try {
            String sql = "select top 4 * from Movie order by ReleaseDate DESC";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listMovie.add(new Movie(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
            System.out.println("get list done!");
        } catch (Exception e) {
            System.out.println("get list movie error: " + e.getMessage());
        }
        return listMovie;
    }

    public ArrayList<Movie> getListMovie() {
        ArrayList<Movie> listMovie = new ArrayList<>();
        try {
            String sql = "select * from Movie order by ReleaseDate DESC";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listMovie.add(new Movie(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
            System.out.println("get list done!");
        } catch (Exception e) {
            System.out.println("get list movie error: " + e.getMessage());
        }
        return listMovie;
    }

    public ArrayList<Movie> getListMoviePage(int index) {
        ArrayList<Movie> listMovie = new ArrayList<>();
        try {
            String sql = "select * from Movie order by ReleaseDate DESC OFFSET ? ROWS FETCH NEXT 7 ROWS ONLY;";
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, (index - 1) * 7);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listMovie.add(new Movie(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
            System.out.println("get list done!");
        } catch (Exception e) {
            System.out.println("get list movie error: " + e.getMessage());
        }
        return listMovie;
    }

    public boolean deleteMovieById(String code) {
        try {
            String strSelect = "DELETE FROM Movie WHERE Id = ?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, code);
            pstm.execute();
            return true;
        } catch (Exception e) {
            System.out.println("delete error " + e.getMessage());
        }
        return false;
    }

    public boolean addMovie(String id, String title, String descript,
            String starCast, String duration, String language, String releaseDate,
            String country, String genre, String img) {
        try {
            String sql = "insert into Movie values(?,?,?,?,?,?,?,?,?,?);";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, title);
            pstm.setString(3, descript);
            pstm.setString(4, starCast);
            pstm.setString(5, duration);
            pstm.setString(6, language);
            pstm.setDate(7, Date.valueOf(releaseDate));
            pstm.setString(8, country);
            pstm.setString(9, genre);
            pstm.setString(10, img);
            pstm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("add movie error: " + e.getMessage());
        }
        return false;
    }

    public ArrayList<Movie> getListMovieByName(String key) {
        ArrayList<Movie> listSearchMovie = new ArrayList<>();
        try {
            String sql = "select * from Movie where Title like ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, "%" + key + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                listSearchMovie.add(new Movie(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
            System.out.println("search movie by key ok!");
        } catch (Exception e) {
            System.out.println("search movie by key error: " + e.getMessage());
        }
        return listSearchMovie;
    }

    public Movie getMovieById(String code) {
        try {
            String strSelect = "select * from Movie where Id = ?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, code);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return new Movie(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7).toLocalDate(), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("get error " + e.getMessage());
        }
        return null;
    }

    public void updateMovieById(String code, String title, String star,
            String description, String duration, String language,
            String release_date, String country, String genre, String img
    ) {
        try {
            String strSelect = "update Movie set Title = ?, Description = ?, StarCast = ?, Duration = ?, Language = ?, ReleaseDate = ?, "
                    + "Country = ?, Genre = ?, Image = ? where Id = ?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, title);
            pstm.setString(2, description);
            pstm.setString(3, star);
            pstm.setString(4, duration);
            pstm.setString(5, language);
            pstm.setString(6, release_date);
            pstm.setString(7, country);
            pstm.setString(8, genre);
            pstm.setString(9, img);
            pstm.setString(10, code);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update error:" + e.getMessage());
        }
    }

    public String getNameMovieById(String id) {
        String movieName = "";
        try {
            String sql = "select * from Movie where Id = ?";
            pstm = connection.prepareStatement( sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                movieName = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("get movie error: " + e.getMessage());
        }
        return movieName;
    }

    public String getImgById(String movieId) {
        String movieImg = "";
        try {
            String sql = "select * from Movie where Id = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, movieId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                movieImg = rs.getString(10);
            }
        } catch (Exception e) {
            System.out.println("get movie error: " + e.getMessage());
        }
        return movieImg;
    }

    public int getTotalMovie() {
        try {
            String sql = "select count(*) from Movie";
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("get movie error: " + e.getMessage());
        }
        return 0;

    }

}
