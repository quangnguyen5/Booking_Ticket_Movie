/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Users;

/**
 *
 * @author LEGION 5
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("sign-in-email");
        String password = req.getParameter("sign-in-passwd");
        UserDAO login = new UserDAO();
        Users user = login.getAccountUser(email, password);
        HttpSession session = req.getSession();
        
//        System.out.println("name: " + user.getName());
        if (user != null) {
            if (user.getUserId().equalsIgnoreCase("admin")) {
                session.setAttribute("admin", user);
                session.setAttribute("userName", user.getName());
                session.setAttribute("userId", user.getUserId());
                resp.sendRedirect("movies");
            } else {
                session.setAttribute("userLogged", user);
                session.setAttribute("userName", user.getName());
                session.setAttribute("userId", user.getUserId());
                resp.sendRedirect("movies");
            }
            req.setAttribute("message", "Login successful!");
        } else {
            req.setAttribute("message", "Login Failed.");
            req.getRequestDispatcher("sign_in.jsp").forward(req, resp);
        }
        //System.out.println(user.getName());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("sign_in.jsp").forward(req, resp);
    }

}
