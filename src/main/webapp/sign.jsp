<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.lifechronicles.dao.UserDAO" %>
        <%@ page import="com.lifechronicles.dto.User" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Processing Signup</title>
                <style>
                    body {
                        font-family: 'Inter', sans-serif;
                        background-color: #f7f7f7;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                        margin: 0;
                    }

                    .container {
                        background-color: #fff;
                        border-radius: 10px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                        padding: 30px;
                        text-align: center;
                        max-width: 500px;
                        width: 100%;
                    }

                    h1 {
                        color: #6c63ff;
                        margin-bottom: 20px;
                    }

                    .message {
                        padding: 15px;
                        margin-bottom: 20px;
                        border-radius: 5px;
                    }

                    .success {
                        background-color: #d4edda;
                        color: #155724;
                        border: 1px solid #c3e6cb;
                    }

                    .error {
                        background-color: #f8d7da;
                        color: #721c24;
                        border: 1px solid #f5c6cb;
                    }

                    .button {
                        background-color: #6c63ff;
                        color: white;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 5px;
                        cursor: pointer;
                        font-size: 16px;
                        text-decoration: none;
                        display: inline-block;
                        margin-top: 20px;
                        transition: background-color 0.3s;
                    }

                    .button:hover {
                        background-color: #5a52d5;
                    }

                    .loader {
                        border: 5px solid #f3f3f3;
                        border-top: 5px solid #6c63ff;
                        border-radius: 50%;
                        width: 40px;
                        height: 40px;
                        animation: spin 1s linear infinite;
                        margin: 20px auto;
                    }

                    @keyframes spin {
                        0% {
                            transform: rotate(0deg);
                        }

                        100% {
                            transform: rotate(360deg);
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <% String fullName=request.getParameter("fullName"); String email=request.getParameter("email");
                        String password=request.getParameter("password"); String
                        confirmPassword=request.getParameter("confirmPassword"); try { if (fullName==null || email==null
                        || password==null || confirmPassword==null || fullName.trim().isEmpty() ||
                        email.trim().isEmpty() || password.trim().isEmpty() || confirmPassword.trim().isEmpty()) { %>
                        <h1>Registration Failed</h1>
                        <div class="message error">
                            All fields are required. Please fill in all the information.
                        </div>
                        <a href="index.jsp" class="button">Back to Signup</a>
                        <% } else if (!password.equals(confirmPassword)) { %>
                            <h1>Registration Failed</h1>
                            <div class="message error">
                                Passwords do not match. Please try again.
                            </div>
                            <a href="index.jsp" class="button">Back to Signup</a>
                            <% } else { UserDAO userDAO=new UserDAO(); if (userDAO.emailExists(email)) { %>
                                <h1>Registration Failed</h1>
                                <div class="message error">
                                    An account with this email already exists. Please login or use a different email.
                                </div>
                                <a href="index.jsp" class="button">Back to Signup</a>
                                <a href="login.jsp" class="button">Go to Login</a>
                                <% } else { User newUser=new User(fullName, email, password); boolean
                                    registered=userDAO.registerUser(newUser); if (registered) { User
                                    registeredUser=userDAO.getUserByEmail(email); session.setAttribute("user_name",
                                    fullName); session.setAttribute("user_email", email); if (registeredUser !=null) {
                                    session.setAttribute("user_id", registeredUser.getUserId()); } %>
                                    <h1>Registration Successful</h1>
                                    <div class="message success">
                                        Welcome to Life Chronicles! Your account has been created successfully. Now you
                                        can Login
                                    </div>
                                    <div class="loader"></div>
                                    <script>
                                        setTimeout(function () {
                                            window.location.href = "login.jsp";
                                        }, 2000);
                                    </script>
                                    <% } else { %>
                                        <h1>Registration Failed</h1>
                                        <div class="message error">
                                            An error occurred while creating your account. Please try again later.
                                        </div>
                                        <a href="index.jsp" class="button">Back to Signup</a>
                                        <% } } } } catch (Exception e) { %>
                                            <h1>Error</h1>
                                            <div class="message error">
                                                An unexpected error occurred. Please try again later.
                                            </div>
                                            <pre><%= e.getMessage() %></pre>
                                            <a href="index.jsp" class="button">Back to Signup</a>
                                            <% } %>
                </div>
            </body>

            </html>