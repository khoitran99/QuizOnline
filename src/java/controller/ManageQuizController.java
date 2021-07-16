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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khoi.tranvan
 */
public class ManageQuizController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("USERMODEL");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            if (user.getRoleId() != 1) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            int index;
            int size = 4;
            if (!request.getParameterMap().containsKey("index")) {
                index = 1;
            } else {
                try {
                    index = Integer.parseInt(request.getParameter("index"));
                } catch (NumberFormatException e) {
                    index = 1;
                }
            }
            
            QuizDAO quizDAO = new QuizDAO();
            
            int totalQuiz = quizDAO.countNumberQuizByUserID(user.getId());
            int totalPage = totalQuiz / size;
            if (totalQuiz % size != 0) {
                totalPage++;
            }
            List<Quiz> listPagingQuiz = quizDAO.getListPagingQuestionsByUser(user.getId(), index, size);
            request.setAttribute("totalItems", totalQuiz);
            request.setAttribute("listQuestion", listPagingQuiz);
            request.setAttribute("totalPage", totalPage);
            request.getRequestDispatcher("/managequiz.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
}
