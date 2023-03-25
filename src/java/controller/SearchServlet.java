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
public class SearchServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("search");
        
        MovieDAO movieDao = new MovieDAO();
        ArrayList<Movie> listMovieSearchByKey = movieDao.getListMovieByName(key);
        req.setAttribute("listMovieSearchByKey", listMovieSearchByKey);
        
        req.setAttribute("key", key);
        req.getRequestDispatcher("list_movies.jsp").forward(req, resp);
    }
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    
}
