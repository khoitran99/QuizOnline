/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entity.Quiz;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khoi.tranvan
 */
public class QuizDAO {

    public String convertStringArrayToString(String[] answers) {
        String answerString = "";
        for (int i = 0; i < answers.length; i++) {
            answerString += answers[i];
        }
        return answerString;
    }

    public java.sql.Date getCurrentSQLDate() {
        Date utilDate = new Date();
        return new java.sql.Date(utilDate.getTime());
    }

    /* Save new quiz to database */
    public int saveNewQuiz(Quiz quiz) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int result = 0;
        String sql = "INSERT INTO question(question,option1,option2,option3,option4,answers,userID,createdDate) \n"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, quiz.getQuestion());
            ps.setString(2, quiz.getOption().get(0));
            ps.setString(3, quiz.getOption().get(1));
            ps.setString(4, quiz.getOption().get(2));
            ps.setString(5, quiz.getOption().get(3));
            ps.setString(6, convertStringArrayToString(quiz.getAnswers()));
            ps.setInt(7, quiz.getUserID());
            ps.setDate(8, getCurrentSQLDate());
            result = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return result;
    }

    /* Save new quiz to database */
    public int updateQuiz(Quiz quiz) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int result = 0;
        String sql = "UPDATE question\n"
                + "SET question = ? , option1 = ? , option2 = ? , option3 = ? , option4 = ? ,answers = ? \n"
                + "WHERE id = ?";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, quiz.getQuestion());
            ps.setString(2, quiz.getOption().get(0));
            ps.setString(3, quiz.getOption().get(1));
            ps.setString(4, quiz.getOption().get(2));
            ps.setString(5, quiz.getOption().get(3));
            ps.setString(6, convertStringArrayToString(quiz.getAnswers()));
            ps.setInt(7, quiz.getId());
            result = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return result;
    }

    /* Get a list a quiz with number of quizs user wants */
    public List<Quiz> getListQuestionsLimit(int limit) throws SQLException, Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP(?) * FROM question ORDER BY NEWID()";
        List<Quiz> listQuiz = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setQuestion(rs.getString("question"));
                List<String> options = new ArrayList<>();
                options.add(rs.getString("option1"));
                options.add(rs.getString("option2"));
                options.add(rs.getString("option3"));
                options.add(rs.getString("option4"));
                quiz.setOption(options);
                String[] answers = rs.getString("answers").split("");
                quiz.setAnswers(answers);
                quiz.setUserID(rs.getInt("userID"));
                quiz.setCreatedDate(rs.getDate("createdDate"));
                listQuiz.add(quiz);
            }
            return listQuiz;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Get quiz by ID */
    public Quiz getQuestionByID(int id) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM question WHERE id=?";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setQuestion(rs.getString("question"));
                List<String> options = new ArrayList<>();
                options.add(rs.getString("option1"));
                options.add(rs.getString("option2"));
                options.add(rs.getString("option3"));
                options.add(rs.getString("option4"));
                quiz.setOption(options);
                String[] answers = rs.getString("answers").split("");
                quiz.setAnswers(answers);
                quiz.setUserID(rs.getInt("userID"));
                quiz.setCreatedDate(rs.getDate("createdDate"));
                return quiz;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    /* Get paging list of quiz by userID */
    public List<Quiz> getListPagingQuestionsByUser(int userId, int index, int size) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM question WHERE userID = ? "
                + "ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Quiz> listQuiz = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, (index - 1) * size);
            ps.setInt(3, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("id"));
                quiz.setQuestion(rs.getString("question"));
                List<String> options = new ArrayList<>();
                options.add(rs.getString("option1"));
                options.add(rs.getString("option2"));
                options.add(rs.getString("option3"));
                options.add(rs.getString("option4"));
                quiz.setOption(options);
                String[] answers = rs.getString("answers").split("");
                quiz.setAnswers(answers);
                quiz.setUserID(rs.getInt("userID"));
                quiz.setCreatedDate(rs.getDate("createdDate"));
                listQuiz.add(quiz);
            }
            return listQuiz;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Number or quiz that user created */
    public int countNumberQuizByUserID(int userID) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS total FROM question WHERE userID = ?";
        int count = 0;
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return count;
    }

    /* Number of quiz that stored in database */
    public int countNumberQuiz() throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS total FROM question";
        int count = 0;
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return count;
    }

}
