<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.lifechronicles.dao.StoryDAO" %>
        <%@ page import="com.lifechronicles.dto.Story" %>
            <%@ page import="java.util.List" %>
                <% if (session.getAttribute("user_email")==null) { response.sendRedirect("index.jsp"); return; } String
                    userName=(String) session.getAttribute("user_name"); String userEmail=(String)
                    session.getAttribute("user_email"); Integer userId=(Integer) session.getAttribute("user_id"); String
                    firstLetter="" ; if (userName !=null && !userName.isEmpty()) { firstLetter=userName.substring(0,
                    1).toUpperCase(); } List<Story> userStories=null; if (userId!=null) { StoryDAO storyDAO=new
                    StoryDAO(); userStories=storyDAO.getStoriesByUser(userId); } %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Welcome to Life Chronicles</title>
                        <style>
                            :root {
                                --primary: #6c63ff;
                                --primary-light: #8a84ff;
                                --secondary: #ff6b6b;
                                --text-dark: #333;
                                --text-light: #666;
                                --background: #f9f9f9;
                                --white: #fff;
                                --shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                                --transition: all 0.3s ease;
                            }

                            * {
                                margin: 0;
                                padding: 0;
                                box-sizing: border-box;
                            }

                            body {
                                font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                                color: var(--text-dark);
                                background-color: var(--background);
                                line-height: 1.6;
                            }

                            .container {
                                width: 100%;
                                max-width: 1200px;
                                margin: 0 auto;
                                padding: 0 20px;
                            }

                            /* Header Styles */
                            header {
                                background-color: var(--white);
                                box-shadow: var(--shadow);
                                position: fixed;
                                width: 100%;
                                top: 0;
                                z-index: 100;
                            }

                            .header-content {
                                display: flex;
                                justify-content: space-between;
                                align-items: center;
                                padding: 15px 0;
                            }

                            .logo {
                                display: flex;
                                align-items: center;
                                font-weight: 700;
                                font-size: 1.5rem;
                                color: var(--primary);
                            }

                            .logo-icon {
                                background-color: var(--primary);
                                color: var(--white);
                                width: 40px;
                                height: 40px;
                                border-radius: 10px;
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                margin-right: 10px;
                                font-weight: 700;
                            }

                            .nav-links ul {
                                display: flex;
                                list-style: none;
                            }

                            .nav-links ul li {
                                margin: 0 15px;
                            }

                            .nav-links ul li a {
                                text-decoration: none;
                                color: var(--text-dark);
                                font-weight: 500;
                                transition: var(--transition);
                            }

                            .nav-links ul li a:hover {
                                color: var(--primary);
                            }

                            .user-menu {
                                position: relative;
                            }

                            .user-avatar {
                                width: 40px;
                                height: 40px;
                                border-radius: 50%;
                                background-color: var(--primary);
                                color: white;
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                font-weight: 700;
                                cursor: pointer;
                            }

                            .dropdown-menu {
                                position: absolute;
                                top: 50px;
                                right: 0;
                                background-color: var(--white);
                                box-shadow: var(--shadow);
                                border-radius: 10px;
                                width: 200px;
                                padding: 10px 0;
                                display: none;
                                z-index: 10;
                            }

                            .dropdown-menu.active {
                                display: block;
                            }

                            .dropdown-menu ul {
                                list-style: none;
                            }

                            .dropdown-menu ul li a {
                                display: block;
                                padding: 10px 20px;
                                text-decoration: none;
                                color: var(--text-dark);
                                transition: var(--transition);
                            }

                            .dropdown-menu ul li a:hover {
                                background-color: #f5f5f5;
                                color: var(--primary);
                            }

                            /* Welcome Section */
                            .welcome-section {
                                padding-top: 150px;
                                padding-bottom: 80px;
                                text-align: center;
                            }

                            .welcome-content {
                                max-width: 800px;
                                margin: 0 auto;
                            }

                            .welcome-header {
                                font-size: 3rem;
                                color: var(--primary);
                                margin-bottom: 20px;
                            }

                            .welcome-text {
                                font-size: 1.1rem;
                                color: var(--text-light);
                                margin-bottom: 30px;
                            }

                            /* Dashboard Section */
                            .dashboard {
                                padding: 60px 0;
                            }

                            .dashboard-header {
                                margin-bottom: 40px;
                                text-align: center;
                            }

                            .dashboard-header h2 {
                                font-size: 2.5rem;
                                color: var(--text-dark);
                                margin-bottom: 10px;
                            }

                            .dashboard-grid {
                                display: grid;
                                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                                gap: 30px;
                            }

                            .dashboard-card {
                                background-color: var(--white);
                                border-radius: 15px;
                                overflow: hidden;
                                box-shadow: var(--shadow);
                                transition: var(--transition);
                            }

                            .dashboard-card:hover {
                                transform: translateY(-5px);
                                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                            }

                            .card-image {
                                height: 200px;
                                overflow: hidden;
                            }

                            .card-image img {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                                transition: var(--transition);
                            }

                            .dashboard-card:hover .card-image img {
                                transform: scale(1.05);
                            }

                            .card-content {
                                padding: 20px;
                            }

                            .card-content h3 {
                                font-size: 1.5rem;
                                margin-bottom: 10px;
                                color: var(--text-dark);
                            }

                            .card-content p {
                                color: var(--text-light);
                                margin-bottom: 20px;
                            }

                            .btn {
                                display: inline-block;
                                padding: 10px 20px;
                                border-radius: 50px;
                                font-weight: 600;
                                text-decoration: none;
                                cursor: pointer;
                                transition: var(--transition);
                                border: none;
                                outline: none;
                            }

                            .btn-primary {
                                background-color: var(--primary);
                                color: var(--white);
                            }

                            .btn-primary:hover {
                                background-color: var(--primary-light);
                            }

                            .btn-outline {
                                border: 2px solid var(--primary);
                                color: var(--primary);
                                background-color: transparent;
                            }

                            .btn-outline:hover {
                                background-color: var(--primary);
                                color: var(--white);
                            }

                            /* Stats Summary */
                            .stats-summary {
                                background-color: var(--white);
                                padding: 60px 0;
                                margin-bottom: 60px;
                            }

                            .stats-grid {
                                display: grid;
                                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                                gap: 30px;
                            }

                            .stat-item {
                                text-align: center;
                            }

                            .stat-number {
                                font-size: 3rem;
                                font-weight: 700;
                                color: var(--primary);
                                margin-bottom: 10px;
                            }

                            .stat-label {
                                font-size: 1.1rem;
                                color: var(--text-light);
                            }

                            /* Footer */
                            footer {
                                background-color: #2c2c54;
                                color: var(--white);
                                padding: 40px 0 20px;
                            }

                            .footer-content {
                                display: grid;
                                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                                gap: 30px;
                                margin-bottom: 30px;
                            }

                            .footer-column h3 {
                                margin-bottom: 20px;
                                font-size: 1.3rem;
                            }

                            .footer-column p {
                                margin-bottom: 20px;
                                color: #ddd;
                            }

                            .footer-column ul {
                                list-style: none;
                            }

                            .footer-column ul li {
                                margin-bottom: 10px;
                            }

                            .footer-column ul li a {
                                color: #ddd;
                                text-decoration: none;
                                transition: var(--transition);
                            }

                            .footer-column ul li a:hover {
                                color: var(--primary);
                            }

                            .copyright {
                                text-align: center;
                                padding-top: 20px;
                                border-top: 1px solid rgba(255, 255, 255, 0.1);
                                color: #ddd;
                            }

                            /* Media Queries */
                            @media (max-width: 768px) {
                                .nav-links {
                                    display: none;
                                }

                                .welcome-header {
                                    font-size: 2.5rem;
                                }
                            }
                        </style>
                    </head>

                    <body>
                        <!-- Header -->
                        <header>
                            <div class="container">
                                <div class="header-content">
                                    <div class="logo">
                                        <div class="logo-icon">LC</div>
                                        <span>Life Chronicles</span>
                                    </div>

                                    <nav class="nav-links">
                                        <ul>
                                            <li><a href="#dashboard">Dashboard</a></li>
                                            <li><a href="#mystories">My Stories</a></li>
                                            <li><a href="#explore">Explore</a></li>
                                            <li><a href="#create">Create</a></li>
                                        </ul>
                                    </nav>

                                    <div class="user-menu">
                                        <div class="user-avatar" id="userAvatar">
                                            <%= firstLetter %>
                                        </div>
                                        <div class="dropdown-menu" id="dropdownMenu">
                                            <ul>
                                                <li><a href="#profile">My Profile</a></li>
                                                <li><a href="#settings">Settings</a></li>
                                                <li><a href="logout.jsp">Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <!-- Welcome Section -->
                        <section class="welcome-section">
                            <div class="container">
                                <div class="welcome-content">
                                    <h1 class="welcome-header">Welcome, <%= userName %>!</h1>
                                    <p class="welcome-text">You've successfully logged into Life Chronicles. Now you can
                                        share your
                                        stories, experiences, and connect with others who have similar interests and
                                        journeys.</p>
                                    <a href="#create" class="btn btn-primary">Share Your First Story</a>
                                </div>
                            </div>
                        </section>

                        <!-- Stats Summary -->
                        <section class="stats-summary">
                            <div class="container">
                                <div class="stats-grid">
                                    <div class="stat-item">
                                        <div class="stat-number">0</div>
                                        <div class="stat-label">Stories Shared</div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-number">0</div>
                                        <div class="stat-label">Connections</div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-number">0</div>
                                        <div class="stat-label">Story Views</div>
                                    </div>
                                    <div class="stat-item">
                                        <div class="stat-number">0</div>
                                        <div class="stat-label">Comments</div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Dashboard Section -->
                        <section class="dashboard" id="dashboard">
                            <div class="container">
                                <div class="dashboard-header">
                                    <h2>Get Started with Life Chronicles</h2>
                                    <p>Here are some ways to make the most of your experience</p>
                                </div>
                                <div class="dashboard-grid">
                                    <div class="dashboard-card">
                                        <div class="card-image">
                                            <img src="https://images.unsplash.com/photo-1517842645767-c639042777db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3Rvcnl8ZW58MHx8MHx8fDA%3D"
                                                alt="Share Stories">
                                        </div>
                                        <div class="card-content">
                                            <h3>Share Your Story</h3>
                                            <p>Create and share your life experiences, adventures, challenges, and
                                                triumphs with the
                                                world.</p>
                                            <a href="create_story.jsp" class="btn btn-primary">✍️ Write a Story</a>
                                        </div>
                                    </div>
                                    <div class="dashboard-card">
                                        <div class="card-image">
                                            <img src="https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGZyaWVuZHMlMjBjb25uZWN0aW9uc3xlbnwwfHwwfHx8MA%3D%3D"
                                                alt="Connect People">
                                        </div>
                                        <div class="card-content">
                                            <h3>Connect with Others</h3>
                                            <p>Find and connect with people who have similar interests, experiences, or
                                                are on
                                                similar journeys.</p>
                                            <a href="#explore" class="btn btn-outline">Explore People</a>
                                        </div>
                                    </div>
                                    <div class="dashboard-card">
                                        <div class="card-image">
                                            <img src="https://images.unsplash.com/photo-1513001900722-370f803f498d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGlzY292ZXJ8ZW58MHx8MHx8fDA%3D"
                                                alt="Discover Stories">
                                        </div>
                                        <div class="card-content">
                                            <h3>Discover Stories</h3>
                                            <p>Explore a wide range of life experiences shared by people from around the
                                                world.</p>
                                            <a href="#discover" class="btn btn-outline">Discover Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                        <!-- My Stories Section -->
                        <% if (userStories !=null && !userStories.isEmpty()) { %>
                            <section style="margin-top: 50px; padding: 0 20px;">
                                <h2
                                    style="color: var(--text-dark); margin-bottom: 30px; font-size: 2rem; text-align: center;">
                                    📚 My Stories (<%= userStories.size() %>)</h2>
                                <div
                                    style="display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 25px; max-width: 1200px; margin: 0 auto;">
                                    <% for (Story story : userStories) { String excerpt=story.getContent().length()> 120
                                        ? story.getContent().substring(0, 120) + "..." : story.getContent();
                                        String date=new java.text.SimpleDateFormat("MMM dd, yyyy").format(story.getCreatedAt());
                                        %>
                                        <div style="background: white; border-radius: 12px; padding: 25px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); transition: all 0.3s; cursor: pointer;"
                                            onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 8px 20px rgba(108,99,255,0.2)';"
                                            onmouseout="this.style.transform='none'; this.style.boxShadow='0 4px 12px rgba(0,0,0,0.08)';">
                                            <h3
                                                style="color: var(--primary); margin-bottom: 12px; font-size: 1.4rem; font-weight: 700;">
                                                <%= story.getTitle() %>
                                            </h3>
                                            <div
                                                style="display: flex; gap: 10px; margin-bottom: 15px; font-size: 0.85rem; color: var(--text-light);">
                                                <span>📅 <%= date %></span>
                                                <% if (story.getCategory() !=null && !story.getCategory().isEmpty()) {
                                                    %>
                                                    <span>•</span>
                                                    <span
                                                        style="background: var(--primary); color: white; padding: 2px 8px; border-radius: 10px;">
                                                        <%= story.getCategory() %>
                                                    </span>
                                                    <% } %>
                                            </div>
                                            <p
                                                style="color: var(--text-dark); margin-bottom: 20px; line-height: 1.7; font-size: 0.95rem;">
                                                <%= excerpt %>
                                            </p>
                                            <div
                                                style="display: flex; justify-content: space-between; align-items: center;">
                                                <a href="view_story.jsp?id=<%= story.getStoryId() %>"
                                                    style="display: inline-block; padding: 10px 20px; background: var(--primary); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s;">Read
                                                    Full Story →</a>
                                                <span style="color: var(--text-light); font-size: 0.85rem;">👁️ <%=
                                                        story.getViewCount() %> views</span>
                                            </div>
                                        </div>
                                        <% } %>
                                </div>
                            </section>
                            <% } else { %>
                                <section style="margin-top: 50px; padding: 60px 20px; text-align: center;">
                                    <div
                                        style="max-width: 500px; margin: 0 auto; background: white; padding: 50px; border-radius: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
                                        <div style="font-size: 4rem; margin-bottom: 20px;">📝</div>
                                        <h3 style="color: var(--text-dark); margin-bottom: 15px; font-size: 1.5rem;">No
                                            Stories Yet!</h3>
                                        <p style="color: var(--text-light); margin-bottom: 30px; line-height: 1.6;">You
                                            haven't written any stories yet. Start sharing your experiences and inspire
                                            others!</p>
                                        <a href="create_story.jsp"
                                            style="display: inline-block; padding: 14px 32px; background: var(--primary); color: white; text-decoration: none; border-radius: 10px; font-weight: 600; font-size: 1.1rem; transition: all 0.3s;"
                                            onmouseover="this.style.background='var(--primary-light)'; this.style.transform='scale(1.05)';"
                                            onmouseout="this.style.background='var(--primary)'; this.style.transform='scale(1)';">✍️
                                            Write Your First Story</a>
                                    </div>
                                </section>
                                <% } %>

                                    <!-- Footer -->
                                    <footer>
                                        <div class="container">
                                            <div class="footer-content">
                                                <div class="footer-column">
                                                    <h3>Life Chronicles</h3>
                                                    <p>Share your journey, inspire others, and connect with people who
                                                        understand
                                                        your
                                                        experiences.</p>
                                                </div>
                                                <div class="footer-column">
                                                    <h3>Quick Links</h3>
                                                    <ul>
                                                        <li><a href="#dashboard">Dashboard</a></li>
                                                        <li><a href="#mystories">My Stories</a></li>
                                                        <li><a href="#explore">Explore</a></li>
                                                        <li><a href="#create">Create</a></li>
                                                        <li><a href="#help">Help Center</a></li>
                                                    </ul>
                                                </div>
                                                <div class="footer-column">
                                                    <h3>Resources</h3>
                                                    <ul>
                                                        <li><a href="#">Community Guidelines</a></li>
                                                        <li><a href="#">Privacy Policy</a></li>
                                                        <li><a href="#">Terms of Service</a></li>
                                                        <li><a href="#">FAQ</a></li>
                                                    </ul>
                                                </div>
                                                <div class="footer-column">
                                                    <h3>Contact</h3>
                                                    <ul>
                                                        <li><a
                                                                href="mailto:support@lifechroncles.com">support@lifechroncles.com</a>
                                                        </li>
                                                        <li><a href="#">Our Blog</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="copyright">
                                                <p>&copy; 2025 Life Chronicles. All rights reserved.</p>
                                            </div>
                                        </div>
                                    </footer>

                                    <script>
                                        // User dropdown menu toggle
                                        const userAvatar = document.getElementById('userAvatar');
                                        const dropdownMenu = document.getElementById('dropdownMenu');

                                        userAvatar.addEventListener('click', () => {
                                            dropdownMenu.classList.toggle('active');
                                        });

                                        // Close dropdown when clicking outside
                                        document.addEventListener('click', (event) => {
                                            if (!userAvatar.contains(event.target) && !dropdownMenu.contains(event.target)) {
                                                dropdownMenu.classList.remove('active');
                                            }
                                        });

                                        // Smooth scrolling for anchor links
                                        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                                            anchor.addEventListener('click', function (e) {
                                                e.preventDefault();
                                                const target = document.querySelector(this.getAttribute('href'));

                                                if (target) {
                                                    window.scrollTo({
                                                        top: target.offsetTop - 80,
                                                        behavior: 'smooth'
                                                    });
                                                }
                                            });
                                        });
                                    </script>
                    </body>

                    </html>
