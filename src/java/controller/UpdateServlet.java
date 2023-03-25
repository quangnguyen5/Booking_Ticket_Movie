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
import java.io.PrintWriter;
import java.time.LocalDate;
import model.Movie;

/**
 *
 * @author LEGION 5
 */
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieDAO dal = new MovieDAO();
        String code = req.getParameter("id");
        String title = req.getParameter("title");
        String star = req.getParameter("star_cast");
        String description = req.getParameter("description");
        String duration = req.getParameter("duration");
        String language = req.getParameter("language");
        String release_date = req.getParameter("release_date");
        String country = req.getParameter("country");
        String genre = req.getParameter("genre");
        String img = req.getParameter("image");
//        Movie m = dal.getMovieById(code);
        if (code != null) {
            dal.updateMovieById(code, title, star, description, duration, language, release_date, country, genre, img);
            resp.sendRedirect("edit_movies");
        } else {
            System.out.println("error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
