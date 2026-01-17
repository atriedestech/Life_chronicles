<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.lifechronicles.dao.StoryDAO" %>
        <%@ page import="com.lifechronicles.dto.Story" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Publishing Story...</title>
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

                    .story-info {
                        background-color: #f8f9fa;
                        padding: 15px;
                        border-radius: 5px;
                        margin: 20px 0;
                        text-align: left;
                    }

                    .story-info strong {
                        color: #6c63ff;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <% try { if (session.getAttribute("user_email")==null) { response.sendRedirect("index.jsp"); return;
                        } Integer userId=(Integer) session.getAttribute("user_id"); if (userId==null) { %>
                        <h1>Error</h1>
                        <div class="message error">
                            User session is invalid. Please login again.
                        </div>
                        <a href="index.jsp" class="button">Go to Login</a>
                        <% return; } String title=request.getParameter("title"); String
                            content=request.getParameter("content"); String category=request.getParameter("category");
                            if (title==null || title.trim().isEmpty()) { %>
                            <h1>Validation Error</h1>
                            <div class="message error">
                                Story title is required. Please provide a title for your story.
                            </div>
                            <a href="create_story.jsp" class="button">Go Back</a>
                            <% return; } if (content==null || content.trim().length()<50) { %>
                                <h1>Validation Error</h1>
                                <div class="message error">
                                    Story content must be at least 50 characters long. Please add more details to your
                                    story!
                                </div>
                                <a href="create_story.jsp" class="button">Go Back</a>
                                <% return; } if (title.trim().length()>255) { %>
                                    <h1>Validation Error</h1>
                                    <div class="message error">
                                        Story title is too long. Maximum 255 characters allowed.
                                    </div>
                                    <a href="create_story.jsp" class="button">Go Back</a>
                                    <% return; } Story story=new Story(); story.setUserId(userId);
                                        story.setTitle(title.trim()); story.setContent(content.trim());
                                        story.setCategory(category!=null && !category.isEmpty() ? category : null);
                                        StoryDAO storyDAO=new StoryDAO(); int storyId=storyDAO.createStory(story); if
                                        (storyId>0) { %>
                                        <h1>🎉 Story Published!</h1>
                                        <div class="message success">
                                            Your story has been published successfully and is now live on Life
                                            Chronicles!
                                        </div>
                                        <div class="story-info">
                                            <p><strong>Title:</strong>
                                                <%= title %>
                                            </p>
                                            <p><strong>Category:</strong>
                                                <%= category!=null && !category.isEmpty() ? category : "Uncategorized"
                                                    %>
                                            </p>
                                            <p><strong>Story ID:</strong> #<%= storyId %>
                                            </p>
                                        </div>
                                        <div class="loader"></div>
                                        <p style="color: #666; margin-top: 15px;">Redirecting to dashboard...</p>
                                        <script>
                                            setTimeout(function () {
                                                window.location.href = "view_story.jsp?id=<%= storyId %>";
                                            }, 2500);
                                        </script>
                                        <% } else { %>
                                            <h1>Publishing Failed</h1>
                                            <div class="message error">
                                                Failed to publish your story. Please try again.
                                            </div>
                                            <a href="create_story.jsp" class="button">Try Again</a>
                                            <% } } catch (Exception e) { %>
                                                <h1>Unexpected Error</h1>
                                                <div class="message error">
                                                    An unexpected error occurred while publishing your story.
                                                </div>
                                                <p style="color: #721c24; font-size: 14px; margin-top: 10px;">
                                                    Error details: <%= e.getMessage() %>
                                                </p>
                                                <a href="create_story.jsp" class="button">Go Back</a>
                                                <a href="login.jsp" class="button"
                                                    style="background-color: #666;">Dashboard</a>
                                                <% e.printStackTrace(); } %>
                </div>
            </body>

            </html>