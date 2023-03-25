/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.BillDAO;
import dal.CinemaDAO;
import dal.CityDAO;
import dal.MovieDAO;
import dal.SeatDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Random;
import model.Bill;
import model.Seat;

/**
 *
 * @author LEGION 5
 */
public class BillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        BillDAO billDao = new BillDAO();
        ArrayList<Bill> listBill = billDao.getListBill();

        System.out.println("seat_sel: " + userId + "," + movieId + "," + cityId + "," + cinemaId + "," + roomId + "," + startTime);
        SeatDAO seatDao = new SeatDAO();
        ArrayList<Seat> listSeatBooked = seatDao.getListSeatBooked(userId, roomId, movieId);

        System.out.println("listSeatBooked: " + listSeatBooked.get(0).getId());

        String seatName = "";
        for (int i = 0; i < listSeatBooked.size(); i++) {
            if (billDao.insertIntoBill(startTime, date, listSeatBooked.get(i).getId())) {
                System.out.println("insert Bill " + listSeatBooked.get(i).getId() + "ok");
                seatName = seatName + " " + listSeatBooked.get(i).getIndex();
            }
        }

        CinemaDAO cinemaDao = new CinemaDAO();
        CityDAO cityDao = new CityDAO();
        MovieDAO movieDao = new MovieDAO();
        UserDAO userDao = new UserDAO();

        String userName = userDao.getNameUserById(userId);
        String movieName = movieDao.getNameMovieById(movieId);
        String cityName = cityDao.getNameCityById(cityId);
        String cinemaName = cinemaDao.getNameCinemaById(cinemaId);
        String movieImg = movieDao.getImgById(movieId);

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
        req.setAttribute("seatName", seatName);
        req.setAttribute("movieImg", movieImg);
        HttpSession session = req.getSession();
        session.setAttribute("customer", userId);
        req.getRequestDispatcher("bill.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("bill.jsp").forward(req, resp);
    }
}
