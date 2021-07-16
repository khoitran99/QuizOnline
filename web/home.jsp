<%-- 
    Document   : home
    Created on : 23-05-2021, 17:27:23
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home Page</title>
        <link rel="stylesheet" href="<c:url value="css/style.css"></c:url>">
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <div class="header_bg"></div>
                    <div class="header_nav">
                        <ul class="menu">
                        <c:if test="${empty QUIZPROCESSING}">
                            <li><a href="home">Home</a></li>
                                <c:if test="${not empty USERMODEL}">
                                <li><a href="takequiz">Take Quiz</a></li>

                                <c:if test="${USERMODEL.roleId == 1}">
                                    <li><a href="makequiz">Make Quiz</a></li>
                                    <li><a href="managequiz">Manage Quiz</a></li>
                                    </c:if>

                                <li><a href="logout">Logout</a></li>
                                </c:if>
                            </c:if>
                    </ul>
                </div>


            </div>
            <div class="row">

                <h3 class="title mt-1 mb-1">Login Form</h3>
                <form name="loginForm" onsubmit="return onSubmitLogin(event)" action="login" method="post">
                    <table>
                        <thead>
                        <th></th>
                        <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>                
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>User Name: </td>
                                <td><input id="username"  class="input_" type="text" name="username" ></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input id="password" class="input_" type="password" name="password"  ></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input class="input_" type="submit" name="submit" id="submit" value="Sign in">
                                    <a href="<c:url value="/register"></c:url>">Register</a>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td> 
                                        <b id="invalidInputServer" class="danger">${messageFail}</b>
                                    <b id="invalidInput" class="danger"></b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <script src="js/validate.js"></script>
        <script src="js/header.js"></script>
    </body>
</html>
