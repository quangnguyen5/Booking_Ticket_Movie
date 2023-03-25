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
public class EditMovieServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieDAO dao = new MovieDAO();
        String index = req.getParameter("index");
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        ArrayList<Movie> listMovie = dao.getListMoviePage(indexPage);
        
        int totalMovie = dao.getTotalMovie();
        int endPage  = totalMovie/7;
        if (totalMovie % 7 == 0){
            endPage++;
        }
        req.setAttribute("endPage", endPage);
        req.setAttribute("totalMovies",totalMovie);
        req.setAttribute("listMovie", listMovie);
        req.getRequestDispatcher("edit_movies.jsp").forward(req, resp);
    }
    
}
