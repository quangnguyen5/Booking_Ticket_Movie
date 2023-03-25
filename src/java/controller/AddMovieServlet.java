/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.MovieDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Movie;

/**
 *
 * @author LEGION 5
 */
public class AddMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieDAO movieDao = new MovieDAO();
        ArrayList<Movie> listMovie = movieDao.getListMovie();
        System.out.println("size: " + listMovie.size());
        String id = "MV" + (listMovie.size()+1);
        String title = req.getParameter("title");
        String starCast = req.getParameter("starCast");
        String descript = req.getParameter("descript");
        String duration = req.getParameter("duration");
        String language = req.getParameter("language");
        String releaseDate = req.getParameter("releaseDate");
        String country = req.getParameter("country");
        String genre = req.getParameter("genre");
        String img = req.getParameter("avatar");

        if (movieDao.addMovie(id, title, descript, starCast, duration, language, releaseDate, country, genre, img)) {
            req.setAttribute("message", "Add successful!");
        } else {
            req.setAttribute("message", "Add fail.");
        }
        //req.getRequestDispatcher("edit_movies").forward(req, resp);
        resp.sendRedirect("edit_movies");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
