/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.CinemaDAO;
import dal.CityDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import model.Cinema;
import model.City;

/**
 *
 * @author LEGION 5
 */
public class BookTimingServlet extends HttpServlet {

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
        Calendar c = Calendar.getInstance();

        int hour = c.get(Calendar.HOUR_OF_DAY);
        System.out.println(hour);
        req.setAttribute("hour", hour);
        Boolean checkStep1 = true, checkStep2 = false;
        if (cinemaId != null) {
            checkStep1 = false;
            checkStep2 = true;
        }
        req.setAttribute("checkStep1", checkStep1);
        req.setAttribute("checkStep2", checkStep2);

        System.out.println("movieId: " + movieId);

        CityDAO cityDao = new CityDAO();
        CinemaDAO cinemaDao = new CinemaDAO();
        ArrayList<City> listCity = cityDao.getListCity();
        req.setAttribute("listCity", listCity);

        ArrayList<Cinema> listCinema = cinemaDao.getListCinemaByCityId(cityId);
        req.setAttribute("listCinema", listCinema);

        req.getRequestDispatcher("book_timing.jsp").forward(req, resp);
    }

}
