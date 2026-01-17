<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Life Chronicles - Share Your Story</title>
        <link rel="stylesheet" href="css/style.css">
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

                    <div class="menu-toggle">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>

                    <nav class="nav-links">
                        <ul>
                            <li><a href="#home">Home</a></li>
                            <li><a href="#features">Features</a></li>
                            <li><a href="#stories">Explore</a></li>
                            <li><a href="create_story.jsp">Share Story</a></li>
                        </ul>
                    </nav>

                    <div class="cta-buttons">
                        <button class="btn btn-login" id="loginBtn">Login</button>
                        <button class="btn btn-signup" id="signupBtn">Sign Up</button>
                    </div>
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="hero" id="home">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-text">
                        <h1>Share Your <span>Life Experiences</span> With The World</h1>
                        <p>Life Chronicles is a platform where you can share your personal stories, adventures, and
                            experiences with people from around the globe. Connect, inspire, and learn from real-life
                            journeys.</p>
                        <button class="btn btn-primary" id="getStartedBtn">Get Started</button>
                    </div>
                    <div class="hero-image">
                        <img src="https://images.unsplash.com/photo-1474452926969-af7bfdb9ca39?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZXhwZXJpZW5jZXN8ZW58MHx8MHx8fDA%3D"
                            alt="Life sharing platform" />
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features" id="features">
            <div class="container">
                <div class="section-title">
                    <h2>Why Life Chronicles?</h2>
                    <p>Discover the features that make our platform unique and engaging for sharing life experiences.
                    </p>
                </div>
                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon">📝</div>
                        <h3>Easy Sharing</h3>
                        <p>Share your experiences with our intuitive and user-friendly interface. Upload text, photos,
                            and
                            videos in minutes.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">🔒</div>
                        <h3>Privacy Control</h3>
                        <p>You decide who sees your stories. Set privacy levels from public to private or share with
                            select
                            groups.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">🌎</div>
                        <h3>Global Community</h3>
                        <p>Connect with people worldwide who share similar experiences or are interested in your unique
                            journey.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">💡</div>
                        <h3>Inspiration</h3>
                        <p>Discover stories that inspire, motivate, and provide new perspectives on life's challenges
                            and
                            triumphs.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">📊</div>
                        <h3>Track Engagement</h3>
                        <p>See how your stories resonate with others through detailed analytics and meaningful
                            interactions.
                        </p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">🎨</div>
                        <h3>Customizable Profiles</h3>
                        <p>Create a profile that reflects your personality with customizable themes and organization
                            options.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stories Section -->
        <section class="stories" id="stories">
            <div class="container">
                <div class="section-title">
                    <h2>Featured Experiences</h2>
                    <p>Explore some of the most inspiring and engaging stories shared by our community members.</p>
                </div>
                <div class="stories-grid">
                    <div class="story-card">
                        <div class="story-image">
                            <img src="https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHRoYWlsYW5kfGVufDB8fDB8fHww"
                                alt="Travel experience" />
                        </div>
                        <div class="story-content">
                            <div class="story-meta">
                                <div class="user-avatar">
                                    <img src="https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
                                        alt="User avatar" />
                                </div>
                                <div class="user-info">
                                    <h4>Alex Johnson</h4>
                                    <p>3 days ago</p>
                                </div>
                            </div>
                            <h3>My Solo Journey Through Southeast Asia</h3>
                            <p>After quitting my corporate job, I embarked on a soul-searching adventure across
                                Thailand,
                                Vietnam, and Cambodia. Here's how it changed my perspective on life...</p>
                            <div class="story-footer">
                                <div class="story-stats">
                                    <div class="stat">
                                        <span>👍</span>
                                        <span>243</span>
                                    </div>
                                    <div class="stat">
                                        <span>💬</span>
                                        <span>42</span>
                                    </div>
                                    <div class="stat">
                                        <span>👁️</span>
                                        <span>1.2k</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="story-card">
                        <div class="story-image">
                            <img src="https://images.unsplash.com/photo-1605379399642-870262d3d051?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c29mdHdhcmUlMjBlbmdpbmVlcnxlbnwwfHwwfHx8MA%3D%3D"
                                alt="Career shift" />
                        </div>
                        <div class="story-content">
                            <div class="story-meta">
                                <div class="user-avatar">
                                    <img src="https://images.unsplash.com/photo-1622049605334-72e1e4432346?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW5kaWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D"
                                        alt="User avatar" />
                                </div>
                                <div class="user-info">
                                    <h4>Maya Patel</h4>
                                    <p>1 week ago</p>
                                </div>
                            </div>
                            <h3>From Engineer to Artisan: My Career Transformation</h3>
                            <p>After 15 years in software engineering, I took the leap to follow my passion for
                                ceramics.
                                The challenges, fears, and ultimate fulfillment of this dramatic shift...</p>
                            <div class="story-footer">
                                <div class="story-stats">
                                    <div class="stat">
                                        <span>👍</span>
                                        <span>189</span>
                                    </div>
                                    <div class="stat">
                                        <span>💬</span>
                                        <span>37</span>
                                    </div>
                                    <div class="stat">
                                        <span>👁️</span>
                                        <span>956</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="story-card">
                        <div class="story-image">
                            <img src="https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1lZGljYWx8ZW58MHx8MHx8fDA%3D"
                                alt="Health journey" />
                        </div>
                        <div class="story-content">
                            <div class="story-meta">
                                <div class="user-avatar">
                                    <img src="https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww"
                                        alt="User avatar" />
                                </div>
                                <div class="user-info">
                                    <h4>Ran Sighania</h4>
                                    <p>2 weeks ago</p>
                                </div>
                            </div>
                            <h3>How I Overcame Chronic Illness Through Mindfulness</h3>
                            <p>My five-year battle with chronic pain led me to discover the healing power of mindfulness
                                meditation. This is the story of my recovery and the practices that helped me...</p>
                            <div class="story-footer">
                                <div class="story-stats">
                                    <div class="stat">
                                        <span>👍</span>
                                        <span>412</span>
                                    </div>
                                    <div class="stat">
                                        <span>💬</span>
                                        <span>89</span>
                                    </div>
                                    <div class="stat">
                                        <span>👁️</span>
                                        <span>2.7k</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Upload Section -->
        <section class="upload-section" id="upload">
            <div class="container">
                <div class="upload-content">
                    <h2>Share Your Experience</h2>
                    <p>Every journey is unique and has the power to inspire others. Share your story with our community.
                    </p>
                    <div class="upload-form">
                        <div class="form-group">
                            <label for="storyContent">Your Story</label>
                            <textarea class="form-control" id="storyContent"
                                placeholder="Share your experience in detail..."></textarea>
                        </div>
                        <div class="form-group">
                            <label>Upload Photos</label>
                            <div class="file-upload" id="fileUpload">
                                <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                    <polyline points="17 8 12 3 7 8"></polyline>
                                    <line x1="12" y1="3" x2="12" y2="15"></line>
                                </svg>
                                <p>Drag & drop photos or <span style="color: var(--primary);">browse</span></p>
                                <input type="file" id="fileInput" style="display: none;" multiple accept="image/*">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="storyTags">Tags</label>
                            <input type="text" class="form-control" id="storyTags"
                                placeholder="Add tags separated by commas (travel, career, health, etc.)">
                        </div>
                        <div class="form-group">
                            <label for="storyPrivacy">Privacy</label>
                            <select class="form-control" id="storyPrivacy">
                                <option value="public">Public - Anyone can see</option>
                                <option value="friends">Friends Only</option>
                                <option value="private">Private - Only me</option>
                            </select>
                        </div>
                        <button class="btn btn-upload" id="submitStory">Share Your Story</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="footer-content">
                    <div class="footer-column">
                        <h3>Life Chronicles</h3>
                        <p>Share your journey, inspire others, and connect with people who understand your experiences.
                        </p>
                        <div class="social-links">
                            <a href="https://github.com/atriedestech" target="_blank" class="social-icon"
                                title="GitHub">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path
                                        d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22">
                                    </path>
                                </svg>
                            </a>
                            <a href="https://www.linkedin.com/in/chouhan-rahul1/" target="_blank" class="social-icon"
                                title="LinkedIn">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path
                                        d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z">
                                    </path>
                                    <rect x="2" y="9" width="4" height="12"></rect>
                                    <circle cx="4" cy="4" r="2"></circle>
                                </svg>
                            </a>
                            <a href="mailto:rahul012chouhan@gmail.com" class="social-icon" title="Email">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path
                                        d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                    </path>
                                    <polyline points="22,6 12,13 2,6"></polyline>
                                </svg>
                            </a>
                        </div>
                    </div>
                    <div class="footer-column">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="#home">Home</a></li>
                            <li><a href="#features">Features</a></li>
                            <li><a href="#stories">Explore Stories</a></li>
                            <li><a href="#upload">Share Your Story</a></li>
                            <li><a href="mailto:rahul012chouhan@gmail.com">Contact</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Resources</h3>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Community Guidelines</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Newsletter</h3>
                        <p>Subscribe to get updates on new features and trending stories.</p>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Your email address">
                            <button class="btn btn-primary" style="margin-top: 10px;">Subscribe</button>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <p>&copy; 2025 Life Chronicles. Built by Rahul Chouhan. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Modal -->
        <div class="modal" id="authModal">
            <div class="modal-content">
                <span class="close-modal">&times;</span>
                <h2 class="modal-title">Welcome to Life Chronicles</h2>
                <div class="tab-header">
                    <div class="tab active" data-tab="login">Login</div>
                    <div class="tab" data-tab="signup">Sign Up</div>
                </div>
                <div class="tab-content active" id="login-tab">
                    <form action="main1.jsp" method="POST" id="loginForm">
                        <div class="form-group">
                            <label for="loginEmail">Email</label>
                            <input type="email" class="form-control" id="loginEmail" name="email"
                                placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Password</label>
                            <input type="password" class="form-control" id="loginPassword" name="password"
                                placeholder="Enter your password" required>
                            <a href="#" class="forgot-password">Forgot password?</a>
                        </div>
                        <input type="submit" value="Login" class="btn btn-primary" style="width: 100%">
                        <!--  <button type="submit" class="btn btn-primary" style="width: 100%;" id="loginSubmit">Login</button> -->

                        <!--  <div class="loader" id="loginLoader"></div> -->
                    </form>
                </div>
                <div class="tab-content" id="signup-tab">
                    <form id="signupForm" action="sign.jsp" method="POST">
                        <div class="form-group">
                            <label for="signupName">Full Name</label>
                            <input type="text" class="form-control" id="signupName" name="fullName"
                                placeholder="Enter your full name" required>
                        </div>
                        <div class="form-group">
                            <label for="signupEmail">Email</label>
                            <input type="email" class="form-control" id="signupEmail" name="email"
                                placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="signupPassword">Password</label>
                            <input type="password" class="form-control" id="signupPassword" name="password"
                                placeholder="Create a password" required>
                        </div>
                        <div class="form-group">
                            <label for="signupConfirmPassword">Confirm Password</label>
                            <input type="password" class="form-control" id="signupConfirmPassword"
                                name="confirmPassword" placeholder="Confirm your password" required>
                        </div>
                        <input type="submit" value="Create Account" class="btn btn-primary" style="width: 100%">
                        <!--  <button type="submit" class="btn btn-primary" style="width: 100%;" id="signupSubmit">Create Account</button>
                    <div class="loader" id="signupLoader"></div> -->
                    </form>
                </div>
            </div>
        </div>

        <!-- Notification -->
        <div class="notification" id="notification"></div>

        <script>
            // DOM Elements
            const menuToggle = document.querySelector('.menu-toggle');
            const navLinks = document.querySelector('.nav-links');
            const storyCards = document.querySelectorAll('.story-card');
            const loginBtn = document.getElementById('loginBtn');
            const signupBtn = document.getElementById('signupBtn');
            const getStartedBtn = document.getElementById('getStartedBtn');
            const authModal = document.getElementById('authModal');
            const closeModal = document.querySelector('.close-modal');
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');
            const fileUpload = document.getElementById('fileUpload');
            const fileInput = document.getElementById('fileInput');
            const submitStory = document.getElementById('submitStory');
            const notification = document.getElementById('notification');
            const loginSubmit = document.getElementById('loginSubmit');
            const signupSubmit = document.getElementById('signupSubmit');
            const loginLoader = document.getElementById('loginLoader');
            const signupLoader = document.getElementById('signupLoader');

            // Check if user is already logged in
            function checkAuthStatus() {
                const user = JSON.parse(localStorage.getItem('user'));
                if (user && user.token) {
                    // Update UI to show logged in state
                    loginBtn.style.display = 'none';
                    signupBtn.textContent = 'My Account';

                    // Set user ID for story submission
                    document.getElementById('userId').value = user.id;
                }
            }

            // Run auth check on page load
            document.addEventListener('DOMContentLoaded', checkAuthStatus);

            // Menu Toggle
            menuToggle.addEventListener('click', () => {
                navLinks.classList.toggle('active');

                const spans = menuToggle.querySelectorAll('span');
                if (navLinks.classList.contains('active')) {
                    spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
                    spans[1].style.opacity = '0';
                    spans[2].style.transform = 'rotate(-45deg) translate(5px, -5px)';
                } else {
                    spans[0].style.transform = 'none';
                    spans[1].style.opacity = '1';
                    spans[2].style.transform = 'none';
                }
            });

            // Scroll Animation for Story Cards
            function checkScroll() {
                storyCards.forEach((card, index) => {
                    const cardTop = card.getBoundingClientRect().top;
                    const windowHeight = window.innerHeight;

                    if (cardTop < windowHeight - 100) {
                        setTimeout(() => {
                            card.classList.add('visible');
                        }, index * 200);
                    }
                });
            }

            // Check on page load and scroll
            window.addEventListener('load', checkScroll);
            window.addEventListener('scroll', checkScroll);

            // Modal Functions
            function openModal() {
                authModal.style.display = 'flex';
                document.body.style.overflow = 'hidden';
            }

            function closeModalFunc() {
                authModal.style.display = 'none';
                document.body.style.overflow = 'auto';
            }

            // Open modal events
            loginBtn.addEventListener('click', openModal);
            signupBtn.addEventListener('click', () => {
                openModal();
                // Switch to signup tab
                tabs.forEach(tab => tab.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));
                document.querySelector('[data-tab="signup"]').classList.add('active');
                document.getElementById('signup-tab').classList.add('active');
            });
            getStartedBtn.addEventListener('click', openModal);

            // Close modal
            closeModal.addEventListener('click', closeModalFunc);
            window.addEventListener('click', (e) => {
                if (e.target === authModal) {
                    closeModalFunc();
                }
            });

            // Tab switching
            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    // Remove active class from all tabs and contents
                    tabs.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(content => content.classList.remove('active'));

                    // Add active class to clicked tab and corresponding content
                    tab.classList.add('active');
                    const tabId = `${tab.getAttribute('data-tab')}-tab`;
                    document.getElementById(tabId).classList.add('active');
                });
            });

            // File Upload
            fileUpload.addEventListener('click', () => {
                fileInput.click();
            });

            fileUpload.addEventListener('dragover', (e) => {
                e.preventDefault();
                fileUpload.style.borderColor = 'var(--primary)';
                fileUpload.style.backgroundColor = 'rgba(108, 99, 255, 0.05)';
            });

            fileUpload.addEventListener('dragleave', () => {
                fileUpload.style.borderColor = '#ddd';
                fileUpload.style.backgroundColor = 'transparent';
            });

            fileUpload.addEventListener('drop', (e) => {
                e.preventDefault();
                fileUpload.style.borderColor = '#ddd';
                fileUpload.style.backgroundColor = 'transparent';

                if (e.dataTransfer.files.length > 0) {
                    fileInput.files = e.dataTransfer.files;
                    showNotification(`${e.dataTransfer.files.length} files selected`);
                }
            });

            fileInput.addEventListener('change', () => {
                if (fileInput.files.length > 0) {
                    showNotification(`${fileInput.files.length} files selected`);
                }
            });

            // Smooth Scrolling for Anchor Links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));

                    if (target) {
                        // Close mobile menu if open
                        if (navLinks.classList.contains('active')) {
                            navLinks.classList.remove('active');
                            menuToggle.querySelectorAll('span').forEach(span => {
                                span.style.transform = 'none';
                            });
                            menuToggle.querySelector('span:nth-child(2)').style.opacity = '1';
                        }

                        window.scrollTo({
                            top: target.offsetTop - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            });

            // Show Notification
            function showNotification(message) {
                notification.textContent = message;
                notification.classList.add('show');

                setTimeout(() => {
                    notification.classList.remove('show');
                }, 3000);
            }

            // Form Submissions
            submitStory.addEventListener('click', (e) => {
                e.preventDefault();
                // Redirect to the working story creation page
                window.location.href = 'create_story.jsp';
            });

            // Login Form
            loginSubmit.addEventListener('click', (e) => {
                e.preventDefault();

                const email = document.getElementById('loginEmail').value;
                const password = document.getElementById('loginPassword').value;

                if (!email || !password) {
                    showNotification('Please fill in all fields');
                    return;
                }

                // Show loading indicator
                loginLoader.style.display = 'block';
                loginSubmit.style.display = 'none';

                // Simulate API call
                setTimeout(() => {
                    loginLoader.style.display = 'none';
                    loginSubmit.style.display = 'block';
                    closeModalFunc();
                    showNotification('Login successful');
                }, 1500);
            });

            // Signup Form
            signupSubmit.addEventListener('click', (e) => {
                e.preventDefault();

                const name = document.getElementById('signupName').value;
                const email = document.getElementById('signupEmail').value;
                const password = document.getElementById('signupPassword').value;
                const confirmPassword = document.getElementById('signupConfirmPassword').value;

                if (!name || !email || !password || !confirmPassword) {
                    showNotification('Please fill in all fields');
                    return;
                }

                if (password !== confirmPassword) {
                    showNotification('Passwords do not match');
                    return;
                }

                // Show loading indicator
                signupLoader.style.display = 'block';
                signupSubmit.style.display = 'none';

                // Simulate API call
                setTimeout(() => {
                    signupLoader.style.display = 'none';
                    signupSubmit.style.display = 'block';
                    closeModalFunc();
                    showNotification('Account created successfully');

                }, 1500);
            });

            // Animation on scroll for Features
            const featureCards = document.querySelectorAll('.feature-card');

            function checkFeatures() {
                featureCards.forEach((card, index) => {
                    const cardTop = card.getBoundingClientRect().top;
                    const windowHeight = window.innerHeight;

                    if (cardTop < windowHeight - 100) {
                        setTimeout(() => {
                            card.style.opacity = '1';
                            card.style.transform = 'translateY(0)';
                        }, index * 100);
                    }
                });
            }

            // Apply initial styles
            featureCards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
            });

            // Check on page load and scroll
            window.addEventListener('load', checkFeatures);
            window.addEventListener('scroll', checkFeatures);
        </script>
    </body>