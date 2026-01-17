package com.lifechronicles.constants;

/**
 * Central repository for all SQL queries used in the application.
 * 
 * Benefits:
 * - Single source of truth for all database queries
 * - Easier maintenance and refactoring
 * - Better code review and documentation
 * - Reduced duplication across DAOs
 * 
 * @author Life Chronicles Team
 * @version 1.0
 */
public final class SQLQueries {
    
    // Prevent instantiation of utility class
    private SQLQueries() {
        throw new AssertionError("Cannot instantiate SQLQueries utility class");
    }
    
    // ========================================
    // USER QUERIES
    // ========================================
    
    /**
     * Check if a user exists with the given email address.
     * Parameters: email (String)
     */
    public static final String CHECK_EMAIL_EXISTS = 
        "SELECT 1 FROM \"user\" WHERE email = ? LIMIT 1";
    
    /**
     * Insert a new user into the database.
     * Parameters: fullName (String), email (String), password (String)
     */
    public static final String INSERT_USER = 
        "INSERT INTO \"user\" (fullName, email, password) VALUES (?, ?, ?)";
    
    /**
     * Authenticate a user by email and password.
     * Parameters: email (String), password (String)
     * Returns: userId, fullName, email, password
     */
    public static final String AUTHENTICATE_USER = 
        "SELECT * FROM \"user\" WHERE email = ? AND password = ?";
    
    /**
     * Get user details by email address.
     * Parameters: email (String)
     * Returns: userId, fullName, email, password
     */
    public static final String SELECT_USER_BY_EMAIL = 
        "SELECT * FROM \"user\" WHERE email = ?";
    
    // ========================================
    // STORY QUERIES
    // ========================================
    
    /**
     * Insert a new story into the database.
     * Parameters: userId (int), title (String), content (String), category (String)
     * Returns: storyId (int)
     */
    public static final String INSERT_STORY = 
        "INSERT INTO story (userid, title, content, category) VALUES (?, ?, ?, ?) RETURNING storyid";
    
    /**
     * Get a single story by ID with author information.
     * Parameters: storyId (int)
     * Returns: All story fields + authorname from joined user table
     */
    public static final String SELECT_STORY_BY_ID = 
        "SELECT s.*, u.fullname as authorname " +
        "FROM story s " +
        "JOIN \"user\" u ON s.userid = u.userid " +
        "WHERE s.storyid = ?";
    
    /**
     * Get all stories written by a specific user.
     * Parameters: userId (int)
     * Returns: All story fields ordered by creation date (newest first)
     */
    public static final String SELECT_STORIES_BY_USER = 
        "SELECT * FROM story WHERE userid = ? ORDER BY createdat DESC";
    
    /**
     * Get all stories with author information.
     * Parameters: None
     * Returns: All story fields + authorname from joined user table, ordered by creation date
     */
    public static final String SELECT_ALL_STORIES = 
        "SELECT s.*, u.fullname as authorname " +
        "FROM story s " +
        "JOIN \"user\" u ON s.userid = u.userid " +
        "ORDER BY s.createdat DESC";
    
    // ========================================
    // FUTURE QUERIES (Commented for reference)
    // ========================================
    
    /*
     * Example pagination query for future implementation:
     * 
     * public static final String SELECT_STORIES_PAGINATED = 
     *     "SELECT s.*, u.fullname as authorname " +
     *     "FROM story s " +
     *     "JOIN \"user\" u ON s.userid = u.userid " +
     *     "ORDER BY s.createdat DESC " +
     *     "LIMIT ? OFFSET ?";
     */
}
