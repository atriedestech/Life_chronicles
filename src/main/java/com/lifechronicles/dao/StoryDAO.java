package com.lifechronicles.dao;

import com.lifechronicles.constants.SQLQueries;
import com.lifechronicles.dto.Story;
import com.lifechronicles.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Story Data Access Object
 * Handles all database operations related to stories
 */
public class StoryDAO {

    /**
     * Create a new story in the database
     * 
     * @param story Story object containing title, content, userId, category
     * @return Generated storyId if successful, -1 if failed
     * @throws SQLException if database error occurs
     */
    public int createStory(Story story) throws SQLException {
        String sql = SQLQueries.INSERT_STORY;
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, story.getUserId());
            pstmt.setString(2, story.getTitle());
            pstmt.setString(3, story.getContent());
            pstmt.setString(4, story.getCategory());
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("storyid");
                }
            }
        }
        
        return -1; // Creation failed
    }

    /**
     * Get a single story by ID with author name
     * 
     * @param storyId Story ID to fetch
     * @return Story object with authorName populated, null if not found
     * @throws SQLException if database error occurs
     */
    public Story getStoryById(int storyId) throws SQLException {
        String sql = SQLQueries.SELECT_STORY_BY_ID;
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, storyId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Story story = new Story();
                    story.setStoryId(rs.getInt("storyid"));
                    story.setUserId(rs.getInt("userid"));
                    story.setTitle(rs.getString("title"));
                    story.setContent(rs.getString("content"));
                    story.setCategory(rs.getString("category"));
                    story.setViewCount(rs.getInt("viewcount"));
                    story.setCreatedAt(rs.getTimestamp("createdat"));
                    story.setUpdatedAt(rs.getTimestamp("updatedat"));
                    story.setAuthorName(rs.getString("authorname"));
                    return story;
                }
            }
        }
        
        return null; // Story not found
    }

    /**
     * Get all stories written by a specific user
     * 
     * @param userId User ID
     * @return List of Story objects, empty list if none found
     * @throws SQLException if database error occurs
     */
    public List<Story> getStoriesByUser(int userId) throws SQLException {
        List<Story> stories = new ArrayList<>();
        String sql = SQLQueries.SELECT_STORIES_BY_USER;
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Story story = new Story();
                    story.setStoryId(rs.getInt("storyid"));
                    story.setUserId(rs.getInt("userid"));
                    story.setTitle(rs.getString("title"));
                    story.setContent(rs.getString("content"));
                    story.setCategory(rs.getString("category"));
                    story.setViewCount(rs.getInt("viewcount"));
                    story.setCreatedAt(rs.getTimestamp("createdat"));
                    story.setUpdatedAt(rs.getTimestamp("updatedat"));
                    stories.add(story);
                }
            }
        }
        
        return stories; // Returns empty list if no stories found
    }

    /**
     * Get all stories with author names (for feed/discovery)
     * 
     * @return List of Story objects with authorName populated
     * @throws SQLException if database error occurs
     */
    public List<Story> getAllStories() throws SQLException {
        List<Story> stories = new ArrayList<>();
        String sql = SQLQueries.SELECT_ALL_STORIES;
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Story story = new Story();
                    story.setStoryId(rs.getInt("storyid"));
                    story.setUserId(rs.getInt("userid"));
                    story.setTitle(rs.getString("title"));
                    story.setContent(rs.getString("content"));
                    story.setCategory(rs.getString("category"));
                    story.setViewCount(rs.getInt("viewcount"));
                    story.setCreatedAt(rs.getTimestamp("createdat"));
                    story.setUpdatedAt(rs.getTimestamp("updatedat"));
                    story.setAuthorName(rs.getString("authorname"));
                    stories.add(story);
                }
            }
        }
        
        return stories;
    }
}
