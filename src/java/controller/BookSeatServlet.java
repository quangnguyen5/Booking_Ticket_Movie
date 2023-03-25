/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.CinemaDAO;
import dal.CityDAO;
import dal.MovieDAO;
import dal.SeatDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Seat;

/**
 *
 * @author LEGION 5
 */
public class BookSeatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SeatDAO seatDao = new SeatDAO();

        String userId = req.getParameter("userId");
        req.setAttribute("userId", userId);

        String movieId = req.getParameter("movieId");
        req.setAttribute("movieId", movieId);

        String cityId = req.getParameter("cityId");
        req.setAttribute("cityId", cityId);

        String cinemaId = req.getParameter("cinemaId");
        req.setAttribute("cinemaId", cinemaId);

        String roomId = req.getParameter("roomId");
        req.setAttribute("roomId", roomId);

        String date = req.getParameter("date");
        req.setAttribute("date", date);

        String startTime = req.getParameter("startTime");
        req.setAttribute("startTime", startTime);

        String[] seat = req.getParameterValues("seat");

        ArrayList<Seat> listSeat = seatDao.getListSeat();

        for (int i = 0; i < seat.length; i++) {
            if (seatDao.importIntoSeat("S" + (listSeat.size() + 1 + i), movieId, roomId, userId, seat[i])) {
                System.out.println("insert " + seat[i] + " done!");
            } else {
                System.out.println("insert " + seat[i] + " fail!");
            }
        }

        System.out.println("seat_sel: " + userId + "," + movieId + "," + cityId + "," + cinemaId + "," + roomId + "," + startTime);

        req.getRequestDispatcher("book_payment.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CinemaDAO cinemaDao = new CinemaDAO();
        CityDAO cityDao = new CityDAO();
        MovieDAO movieDao = new MovieDAO();
        UserDAO userDao = new UserDAO();
        SeatDAO seatDao = new SeatDAO();
        
        String userId = req.getParameter("userId");
        req.setAttribute("userId", userId);

        String movieId = req.getParameter("movieId");
        req.setAttribute("movieId", movieId);

        String cityId = req.getParameter("cityId");
        cityDao.getNameCityById(cityId);
        req.setAttribute("cityId", cityId);

        String cinemaId = req.getParameter("cinemaId");
        req.setAttribute("cinemaId", cinemaId);

        String roomId = req.getParameter("roomId");
        req.setAttribute("roomId", roomId);

        String date = req.getParameter("date");
        req.setAttribute("date", date);

        String startTime = req.getParameter("startTime");
        req.setAttribute("startTime", startTime);

        String userName = userDao.getNameUserById(userId);
        String movieName = movieDao.getNameMovieById(movieId);
        String cityName = cityDao.getNameCityById(cityId);
        String cinemaName = cinemaDao.getNameCinemaById(cinemaId);
        String roomName = "";
        if (roomId.equalsIgnoreCase("Sc1")) {
            roomName = "Screen 1";
        } else if (roomId.equalsIgnoreCase("Sc2")) {
            roomName = "Screen 2";
        } else {
            roomName = "Screen 3";
        }
        req.setAttribute("userName", userName);
        req.setAttribute("movieName", movieName);
        req.setAttribute("cityName", cityName);
        req.setAttribute("cinemaName", cinemaName);
        req.setAttribute("roomName", roomName);
        ArrayList<String> listSeatId = seatDao.getListSeatSelected(userId, movieId, roomId);
        req.setAttribute("listSeatId", listSeatId);

        req.getRequestDispatcher("book_seat.jsp").forward(req, resp);
    }

}
