package com.lifechronicles.dto;

import java.sql.Timestamp;

/**
 * Story Data Transfer Object
 * Represents a story entity with fields matching the database schema
 */
public class Story {
    private int storyId;
    private int userId;
    private String title;
    private String content;
    private String category;
    private int viewCount;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Not in database - populated via JOIN for display
    private String authorName;

    // Default constructor
    public Story() {
    }

    // Constructor with all fields (for reading from database)
    public Story(int storyId, int userId, String title, String content, String category, 
                 int viewCount, Timestamp createdAt, Timestamp updatedAt) {
        this.storyId = storyId;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.category = category;
        this.viewCount = viewCount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Constructor for creating new story (without ID and timestamps)
    public Story(int userId, String title, String content, String category) {
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.category = category;
    }

    // Getters and Setters
    public int getStoryId() {
        return storyId;
    }

    public void setStoryId(int storyId) {
        this.storyId = storyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    /**
     * Get excerpt of story content (first 200 characters)
     * Useful for displaying story previews in lists
     * 
     * @return First 200 characters of content with "..." or full content if shorter
     */
    public String getExcerpt() {
        if (content == null) {
            return "";
        }
        return content.length() > 200 
            ? content.substring(0, 200) + "..." 
            : content;
    }

    @Override
    public String toString() {
        return "Story{" +
                "storyId=" + storyId +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", viewCount=" + viewCount +
                ", createdAt=" + createdAt +
                '}';
    }
}
