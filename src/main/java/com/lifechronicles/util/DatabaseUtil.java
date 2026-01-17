package com.lifechronicles.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database Utility Class
 * Centralizes database connection management
 */
public class DatabaseUtil {

    // Database configuration defaults
    private static final String DEFAULT_HOST = "localhost";
    private static final String DEFAULT_PORT = "5432";
    private static final String DEFAULT_DB = "lifechronicles";
    private static final String DEFAULT_USER = "postgres";
    private static final String DEFAULT_PASS = "postgres";

    // PostgreSQL Driver
    private static final String DRIVER_CLASS = "org.postgresql.Driver";

    // Static block to load JDBC driver
    static {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(
                    "PostgreSQL JDBC Driver not found. Ensure the library is added to the classpath.", e);
        }
    }

    /**
     * Get a database connection
     * Reads credentials from environment variables or falls back to defaults.
     * 
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        String host = System.getenv("DB_HOST");
        if (host == null || host.isEmpty())
            host = DEFAULT_HOST;

        String port = System.getenv("DB_PORT");
        if (port == null || port.isEmpty())
            port = DEFAULT_PORT;

        String dbName = System.getenv("DB_NAME");
        if (dbName == null || dbName.isEmpty())
            dbName = DEFAULT_DB;

        String user = System.getenv("DB_USER");
        if (user == null || user.isEmpty())
            user = DEFAULT_USER;

        String password = System.getenv("DB_PASSWORD");
        if (password == null || password.isEmpty())
            password = DEFAULT_PASS;

        String url = String.format("jdbc:postgresql://%s:%s/%s", host, port, dbName);

        return DriverManager.getConnection(url, user, password);
    }

    /**
     * Close database resources safely
     * 
     * @param conn Connection to close
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Test database connectivity
     * 
     * @return true if connection successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
