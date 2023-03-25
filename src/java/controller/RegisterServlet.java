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
import java.io.IOException;
import java.util.ArrayList;
import model.Users;

/**
 *
 * @author LEGION 5
 */
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("sign-up-name");
        String email = req.getParameter("sign-up-email");
        String passwd = req.getParameter("sign-up-passwd");
        String phone = req.getParameter("sign-up-phone");
        System.out.println(name + ", " + email + ", " + passwd);

        UserDAO register = new UserDAO();
        ArrayList<Users> listUser = register.getListUser();
        boolean check = true;
        for (int i = 0; i < listUser.size(); i++) {
            if (email.equalsIgnoreCase(listUser.get(i).getEmail())) {
                req.setAttribute("message", "Your email is registered");
                check = false;
            }
        }
        if (register.register("AC" + Integer.toString(listUser.size()), name, email, passwd, phone) && check) {
            req.setAttribute("message", "Sign up successful!");
        } else {
            req.setAttribute("message", "Sign up failed.");
        }
        req.getRequestDispatcher("sign_in.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
