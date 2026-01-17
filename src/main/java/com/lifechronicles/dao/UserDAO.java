package com.lifechronicles.dao;

import com.lifechronicles.constants.SQLQueries;
import com.lifechronicles.dto.User;
import com.lifechronicles.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * User Data Access Object
 * Handles all database operations related to users
 */
public class UserDAO {

    /**
     * Check if a user with the given email already exists
     * 
     * @param email Email address to check
     * @return true if user exists, false otherwise
     * @throws SQLException if database error occurs
     */
    public boolean emailExists(String email) throws SQLException {
        String sql = SQLQueries.CHECK_EMAIL_EXISTS;

        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // Returns true if email exists
            }
        }
    }

    /**
     * Register a new user in the database
     * 
     * @param user User object containing registration data
     * @return true if registration successful, false otherwise
     * @throws SQLException if database error occurs
     */
    public boolean registerUser(User user) throws SQLException {
        String sql = SQLQueries.INSERT_USER;

        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getFullName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    /**
     * Authenticate a user with email and password
     * 
     * @param email    User's email address
     * @param password User's password
     * @return User object if authentication successful, null otherwise
     * @throws SQLException if database error occurs
     */
    public User authenticateUser(String email, String password) throws SQLException {
        String sql = SQLQueries.AUTHENTICATE_USER;

        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // User found, create and return User object
                    User user = new User();
                    user.setUserId(rs.getInt("userId"));
                    user.setFullName(rs.getString("fullName"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }
            }
        }

        return null; // Authentication failed
    }

    /**
     * Get user by email address
     * 
     * @param email Email address to search for
     * @return User object if found, null otherwise
     * @throws SQLException if database error occurs
     */
    public User getUserByEmail(String email) throws SQLException {
        String sql = SQLQueries.SELECT_USER_BY_EMAIL;

        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("userId"));
                    user.setFullName(rs.getString("fullName"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }
            }
        }

        return null;
    }
}
