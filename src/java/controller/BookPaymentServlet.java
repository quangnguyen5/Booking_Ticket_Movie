/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.BillDAO;
import dal.CinemaDAO;
import dal.CityDAO;
import dal.SeatDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Bill;
import model.Cinema;
import model.City;
import model.Seat;

/**
 *
 * @author LEGION 5
 */
public class BookPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        req.setAttribute("userId", userId);

        String movieId = req.getParameter("movieId");
        req.setAttribute("movieId", movieId);

        String cityId = req.getParameter("cityId");
        req.setAttribute("cityId", cityId);

        String cinemaId = req.getParameter("cinemaId");
        req.setAttribute("cinemaId", cinemaId);

        String date = req.getParameter("date");
        req.setAttribute("date", date);

        String startTime = req.getParameter("startTime");
        req.setAttribute("startTime", startTime);

        

        req.getRequestDispatcher("book_payment.jsp").forward(req, resp);
    }

}
