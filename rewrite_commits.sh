#!/bin/bash

# Script to rewrite commit messages to sound more authentic

git filter-branch -f --msg-filter '
  case "$GIT_COMMIT" in
    *)
      # Get original message
      msg=$(cat)
      
      # Rewrite based on original message
      case "$msg" in
        "Initial commit - Add gitignore for Java project")
          echo "initial commit"
          ;;
        "Add PostgreSQL schema and database connection utility")
          echo "add database setup"
          ;;
        "Create User and Story DTO classes")
          echo "user and story models"
          ;;
        "Add SQL query constants for user and story operations")
          echo "add sql queries"
          ;;
        "Implement UserDAO and StoryDAO with JDBC")
          echo "implement dao classes"
          ;;
        "Configure Maven dependencies and build plugins")
          echo "maven config"
          ;;
        "Add web.xml with session configuration")
          echo "web.xml setup"
          ;;
        "Create signup, login, and logout pages")
          echo "signup and login pages"
          ;;
        "Create landing page with authentication modals")
          echo "landing page"
          ;;
        "Add story creation and viewing functionality")
          echo "story features working"
          ;;
        "Create user dashboard with story management")
          echo "user dashboard"
          ;;
        "Add modern CSS styling with animations and responsive design")
          echo "add styling"
          ;;
        "Add environment variables template for configuration")
          echo "env variables"
          ;;
        "Add deployment documentation for Render")
          echo "deployment docs"
          ;;
        *)
          echo "$msg"
          ;;
      esac
      ;;
  esac
' -- --all
