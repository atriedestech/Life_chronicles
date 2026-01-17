<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% if (session.getAttribute("user_email")==null) { response.sendRedirect("index.jsp"); return; } String
        userName=(String) session.getAttribute("user_name"); %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Share Your Story - Life Chronicles</title>
            <style>
                :root {
                    --primary: #6c63ff;
                    --primary-light: #8a84ff;
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
                    background-color: var(--background);
                    color: var(--text-dark);
                    line-height: 1.6;
                }

                .container {
                    max-width: 900px;
                    margin: 50px auto;
                    padding: 40px;
                    background-color: var(--white);
                    border-radius: 15px;
                    box-shadow: var(--shadow);
                }

                h1 {
                    color: var(--primary);
                    margin-bottom: 10px;
                    font-size: 2.5rem;
                }

                .subtitle {
                    color: var(--text-light);
                    margin-bottom: 30px;
                    font-size: 1.1rem;
                }

                .form-group {
                    margin-bottom: 25px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-weight: 600;
                    color: var(--text-dark);
                    font-size: 1rem;
                }

                input[type="text"],
                textarea,
                select {
                    width: 100%;
                    padding: 15px;
                    border: 2px solid #e0e0e0;
                    border-radius: 8px;
                    font-family: 'Inter', sans-serif;
                    font-size: 16px;
                    transition: var(--transition);
                }

                input[type="text"]:focus,
                textarea:focus,
                select:focus {
                    outline: none;
                    border-color: var(--primary);
                    box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.1);
                }

                textarea {
                    min-height: 350px;
                    resize: vertical;
                    line-height: 1.8;
                }

                .char-count {
                    text-align: right;
                    color: var(--text-light);
                    font-size: 14px;
                    margin-top: 5px;
                }

                .char-count.warn {
                    color: #ff6b6b;
                }

                .button-group {
                    display: flex;
                    gap: 15px;
                    margin-top: 30px;
                }

                .btn {
                    padding: 15px 30px;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 16px;
                    cursor: pointer;
                    transition: var(--transition);
                    text-decoration: none;
                    display: inline-block;
                    text-align: center;
                }

                .btn-primary {
                    background-color: var(--primary);
                    color: var(--white);
                    border: none;
                    flex: 1;
                }

                .btn-primary:hover {
                    background-color: var(--primary-light);
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(108, 99, 255, 0.3);
                }

                .btn-secondary {
                    background-color: transparent;
                    color: var(--text-dark);
                    border: 2px solid #e0e0e0;
                }

                .btn-secondary:hover {
                    background-color: #f5f5f5;
                }

                .tips {
                    background-color: #f0f7ff;
                    border-left: 4px solid var(--primary);
                    padding: 15px 20px;
                    margin-bottom: 25px;
                    border-radius: 5px;
                }

                .tips h3 {
                    color: var(--primary);
                    font-size: 1.1rem;
                    margin-bottom: 10px;
                }

                .tips ul {
                    margin-left: 20px;
                    color: var(--text-dark);
                }

                .tips li {
                    margin-bottom: 5px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1>✍️ Share Your Story</h1>
                <p class="subtitle">Hello, <%= userName %>! What experience would you like to share today?</p>

                <div class="tips">
                    <h3>💡 Writing Tips</h3>
                    <ul>
                        <li>Be authentic and honest - real stories resonate</li>
                        <li>Include specific details to bring your story to life</li>
                        <li>Share what you learned or how you grew</li>
                        <li>Your story can help someone going through something similar</li>
                    </ul>
                </div>

                <form action="save_story.jsp" method="POST" id="storyForm">
                    <div class="form-group">
                        <label for="title">Story Title *</label>
                        <input type="text" id="title" name="title" maxlength="255" required
                            placeholder="Give your story a compelling title...">
                        <div id="title-count" class="char-count">0 / 255 characters</div>
                    </div>

                    <div class="form-group">
                        <label for="content">Your Story *</label>
                        <textarea id="content" name="content" required
                            placeholder="Start writing your story... Share your experiences, thoughts, and lessons learned. Be as detailed as you'd like!"></textarea>
                        <div id="content-count" class="char-count">0 words (minimum 50 characters)</div>
                    </div>

                    <div class="form-group">
                        <label for="category">Category (Optional)</label>
                        <select id="category" name="category">
                            <option value="">Choose a category...</option>
                            <option value="Personal">Personal Growth</option>
                            <option value="Travel">Travel & Adventure</option>
                            <option value="Love">Love & Relationships</option>
                            <option value="Career">Career Journey</option>
                            <option value="Family">Family Stories</option>
                            <option value="Challenge">Overcoming Challenges</option>
                            <option value="Achievement">Achievements & Milestones</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">📖 Publish Story</button>
                        <a href="login.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>

            <script>
                // Title character counter
                const titleInput = document.getElementById('title');
                const titleCount = document.getElementById('title-count');

                titleInput.addEventListener('input', function () {
                    const length = this.value.length;
                    titleCount.textContent = length + ' / 255 characters';

                    if (length > 240) {
                        titleCount.classList.add('warn');
                    } else {
                        titleCount.classList.remove('warn');
                    }
                });

                // Content word and character counter
                const contentInput = document.getElementById('content');
                const contentCount = document.getElementById('content-count');

                contentInput.addEventListener('input', function () {
                    const text = this.value.trim();
                    const charCount = this.value.length;
                    const words = text.split(/\s+/).filter(w => w.length > 0).length;

                    contentCount.textContent = words + ' words (' + charCount + ' characters)';

                    if (charCount < 50) {
                        contentCount.classList.add('warn');
                        contentCount.textContent = words + ' words (minimum 50 characters - ' + (50 - charCount) + ' more needed)';
                    } else {
                        contentCount.classList.remove('warn');
                    }
                });

                // Form validation
                document.getElementById('storyForm').addEventListener('submit', function (e) {
                    const title = titleInput.value.trim();
                    const content = contentInput.value.trim();

                    if (title.length === 0) {
                        e.preventDefault();
                        alert('Please enter a title for your story.');
                        titleInput.focus();
                        return;
                    }

                    if (content.length < 50) {
                        e.preventDefault();
                        alert('Your story must be at least 50 characters long. Please add more details!');
                        contentInput.focus();
                        return;
                    }
                });
            </script>
        </body>

        </html>