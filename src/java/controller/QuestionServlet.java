/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Movie;
import model.Question;

/**
 *
 * @author LEGION 5
 */
public class QuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QuestionDAO dao = new QuestionDAO();
        String A = req.getParameter("A");
        String B = req.getParameter("B");
        String C = req.getParameter("C");
        String D = req.getParameter("D");
        ArrayList<Question> listQuestion = dao.getListQuestion();
        ArrayList<Question> listQuestion1 = dao.getListQuestion1();
        ArrayList<Question> listQuestion2 = dao.getListQuestion2();
        req.setAttribute("listQuestion", listQuestion);
        req.setAttribute("listQuestion1", listQuestion1);
        req.setAttribute("listQuestion2", listQuestion2);

        if (A != null) {
            ArrayList<Question> listResult = dao.getListResult(A);

        }
        if (B != null) {
            ArrayList<Question> listResult = dao.getListResult(B);
        }
        if (C != null) {
            ArrayList<Question> listResult = dao.getListResult(C);
        }
        if (D != null) {
            ArrayList<Question> listResult = dao.getListResult(D);
        }
        req.getRequestDispatcher("Question2.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QuestionDAO dao = new QuestionDAO();
        ArrayList<Question> listQuestion = dao.getListQuestion();
        ArrayList<Question> listQuestion1 = dao.getListQuestion1();
        ArrayList<Question> listQuestion2 = dao.getListQuestion2();

        ArrayList<Question> listAnswer = dao.getListAnswer();
        System.out.println(listQuestion.get(0).getA());
        req.setAttribute("listQuestion", listQuestion);
        req.setAttribute("listAnswer", listAnswer);

        req.getRequestDispatcher("Question.jsp").forward(req, resp);
    }

}
