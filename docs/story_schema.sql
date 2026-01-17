-- Story table schema for Life Chronicles
-- PostgreSQL-compatible with lowercase unquoted column names

-- Drop existing table if needed (for clean reinstall)
-- DROP TABLE IF EXISTS story CASCADE;

-- Create story table
CREATE TABLE IF NOT EXISTS story (
    storyid SERIAL PRIMARY KEY,
    userid INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100),
    viewcount INT DEFAULT 0,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraint
    CONSTRAINT fk_story_user 
        FOREIGN KEY (userid) 
        REFERENCES "user"(userid) 
        ON DELETE CASCADE
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_story_userid ON story(userid);
CREATE INDEX IF NOT EXISTS idx_story_createdat ON story(createdat DESC);
CREATE INDEX IF NOT EXISTS idx_story_category ON story(category);

-- Add comments for documentation
COMMENT ON TABLE story IS 'User-generated stories for Life Chronicles platform';
COMMENT ON COLUMN story.storyid IS 'Auto-generated primary key';
COMMENT ON COLUMN story.userid IS 'Foreign key referencing user.userid';
COMMENT ON COLUMN story.title IS 'Story title (required, max 255 chars)';
COMMENT ON COLUMN story.content IS 'Full story text (required)';
COMMENT ON COLUMN story.category IS 'Optional category (Personal, Travel, etc.)';
COMMENT ON COLUMN story.viewcount IS 'Number of times story has been viewed';
COMMENT ON COLUMN story.createdat IS 'Timestamp when story was created';
COMMENT ON COLUMN story.updatedat IS 'Timestamp when story was last updated';
