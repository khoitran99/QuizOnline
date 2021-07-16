/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuizDAO;
import entity.Quiz;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khoi.tranvan
 */
public class MakeQuizController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {

            User user = (User) request.getSession().getAttribute("USERMODEL");

            /* Check if user has loged in */
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            /* Check if user has role teacher */
            if (user.getRoleId() != 1) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            request.getRequestDispatcher("makequiz.jsp").forward(request, response);

        } catch (IOException | ServletException e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            User user = (User) request.getSession().getAttribute("USERMODEL");

            /* Check if user has loged in */
            if (user != null) {

                String question = request.getParameter("question").trim();
                String option1 = request.getParameter("option1").trim();
                String option2 = request.getParameter("option2").trim();
                String option3 = request.getParameter("option3").trim();
                String option4 = request.getParameter("option4").trim();
                List<String> listOption = new ArrayList<>();
                listOption.add(option1);
                listOption.add(option2);
                listOption.add(option3);
                listOption.add(option4);
                String[] answers = request.getParameterValues("answers");
                Quiz quizNew = new Quiz();
                quizNew.setQuestion(question);
                quizNew.setOption(listOption);
                quizNew.setAnswers(answers);
                quizNew.setUserID(user.getId());

                QuizDAO quizDAO = new QuizDAO();

                int result = quizDAO.saveNewQuiz(quizNew);
                request.setAttribute("result", result);
                request.getRequestDispatcher("makequiz.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
