-- PostgreSQL Schema for Life Chronicles
-- Run this on your Render PostgreSQL database

-- ========================================
-- USER TABLE
-- ========================================
-- Note: "user" is a reserved keyword in PostgreSQL, so it must be quoted.
CREATE TABLE IF NOT EXISTS "user" (
    userid SERIAL PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- STORY TABLE  
-- ========================================
CREATE TABLE IF NOT EXISTS story (
    storyid SERIAL PRIMARY KEY,
    userid INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100),
    viewcount INTEGER DEFAULT 0,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES "user"(userid) ON DELETE CASCADE
);

-- ========================================
-- INDEXES FOR PERFORMANCE
-- ========================================
CREATE INDEX IF NOT EXISTS idx_user_email ON "user"(email);
CREATE INDEX IF NOT EXISTS idx_story_userid ON story(userid);
CREATE INDEX IF NOT EXISTS idx_story_createdat ON story(createdat DESC);

-- ========================================
-- VERIFICATION
-- ========================================
-- Run these to verify:
-- \dt                    -- List tables
-- \d "user"              -- User table structure
-- \d story               -- Story table structure
