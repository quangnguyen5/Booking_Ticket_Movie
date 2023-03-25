/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.MovieDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Movie;
import model.Users;

/**
 *
 * @author LEGION 5
 */
public class MoviesServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieDAO dao = new MovieDAO();
        ArrayList<Movie> listMovie = dao.getListTop4Movie();
        
        HttpSession session = req.getSession();
        req.setAttribute("userName", session.getAttribute("name"));
        
        req.setAttribute("listMovie", listMovie);
        
        ArrayList<Movie> listMovieAction = dao.getListTop4MovieByGenre("action");
        req.setAttribute("listMovieAction", listMovieAction);
        
        ArrayList<Movie> listMovieAnimation = dao.getListTop4MovieByGenre("animation");
        req.setAttribute("listMovieAnimation", listMovieAnimation);
        
        ArrayList<Movie> listMovieHorrified = dao.getListTop4MovieByGenre("horrified");
        req.setAttribute("listMovieHorrified", listMovieHorrified);
        
        ArrayList<Movie> listMovieRomance = dao.getListTop4MovieByGenre("romance");
        req.setAttribute("listMovieRomance", listMovieRomance);
        
        ArrayList<Movie> listMoviesHumor = dao.getListTop4MovieByGenre("humor");
        req.setAttribute("listMoviesHumor", listMoviesHumor);
        
        req.getRequestDispatcher("movies.jsp").forward(req, resp);
    }
    
}
