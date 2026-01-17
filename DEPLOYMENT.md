# Deploying Life Chronicles to Render

This guide will help you deploy the Life Chronicles application to Render.

## Prerequisites

- [Render Account](https://render.com) (free tier available)
- GitHub repository with your Life Chronicles code
- PostgreSQL knowledge (basic)

---

## Step-by-Step Deployment

### 1. Create PostgreSQL Database on Render

1. Log in to your [Render Dashboard](https://dashboard.render.com)
2. Click "New +" → **PostgreSQL**
3. Configure your database:
   - **Name**: `lifechronicles-db`
   - **Database**: `lifechronicles`
   - **User**: `lifechronicles_user` (or leave default)
   - **Region**: Choose closest to your users
   - **Plan**: **Free** (or paid for production)
4. Click **Create Database**
5. Wait for the database to be created (~2-3 minutes)

---

### 2. Run Database Schema

Once your PostgreSQL database is ready:

1. Go to your database in Render dashboard
2. Click the **"Connect"** tab
3. Copy the **PSQL Command** (looks like: `PGPASSWORD=xxx psql -h xxx ...`)
4. Open your terminal and run the PSQL command to connect
5. Once connected, copy the contents of `schema.sql` from this repository
6. Paste and execute in the PSQL terminal
7. Verify tables were created:
   ```sql
   \dt
   ```
   You should see `user` and `story` tables

---

### 3. Create Web Service on Render

1. In Render dashboard, click "New +" → **Web Service**
2. Connect your GitHub repository
3. Configure the service:

   **Basic Settings:**
   - **Name**: `life-chronicles`
   - **Region**: Same as your database
   - **Branch**: `main` (or your default branch)
   - **Root Directory**: Leave empty
   - **Environment**: `Java`
   - **Build Command**: `mvn clean package`
   - **Start Command**: 
     ```bash
     java -jar target/webapp-runner.jar --port $PORT target/*.war
     ```

4. Click **Advanced** to set environment variables

---

### 4. Configure Environment Variables

In the **Environment Variables** section, add the following:

Go to your PostgreSQL database → **Info** tab, then copy the connection details:

| Key | Value | Source |
|-----|-------|--------|
| `DB_HOST` | `dpg-xxxxx-a.oregon-postgres.render.com` | From PostgreSQL Info tab |
| `DB_PORT` | `5432` | From PostgreSQL Info tab |
| `DB_NAME` | `lifechronicles` | Your database name |
| `DB_USER` | `lifechronicles_user` | From PostgreSQL Info tab |
| `DB_PASSWORD` | `<generated-password>` | From PostgreSQL Info tab (Internal Database URL) |

> **Tip:** You can also use the **Internal Database URL** from your PostgreSQL service, but you'll need to parse it into individual components.

Example Internal Database URL:
```
postgres://user:password@hostname:port/database
```

---

### 5. Add webapp-runner Dependency

Render needs a way to run your WAR file. Add this to your `pom.xml` in the `<build><plugins>` section:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-dependency-plugin</artifactId>
    <version>3.3.0</version>
    <executions>
        <execution>
            <phase>package</phase>
            <goals>
                <goal>copy</goal>
            </goals>
            <configuration>
                <artifactItems>
                    <artifactItem>
                        <groupId>com.heroku</groupId>
                        <artifactId>webapp-runner</artifactId>
                        <version>9.0.52.1</version>
                        <destFileName>webapp-runner.jar</destFileName>
                    </artifactItem>
                </artifactItems>
            </configuration>
        </execution>
    </executions>
</plugin>
```

---

### 6. Deploy!

1. Click **Create Web Service**
2. Render will automatically:
   - Clone your repository
   - Run `mvn clean package`
   - Start your application with webapp-runner
3. Monitor the deployment logs
4. Once deployed, you'll see "Your service is live 🎉"

---

### 7. Verify Deployment

1. Click on your service URL (e.g., `https://life-chronicles.onrender.com`)
2. Test all features:
   - [ ] Landing page loads
   - [ ] Sign up works
   - [ ] Login works
   - [ ] Create story works
   - [ ] View story works
   - [ ] Logout works

---

## Troubleshooting

### Database Connection Errors

**Error:** `Connection refused` or `could not connect to server`

**Solution:**
- Verify environment variables are set correctly
- Check DB_HOST uses the **internal hostname** (ends with `.render.com`)
- Ensure database and web service are in the **same region**

### Build Failures

**Error:** `mvn: command not found` or `BUILD FAILED`

**Solution:**
- Verify `pom.xml` is in the repository root
- Check Build Command is `mvn clean package`
- Ensure Java version in `pom.xml` matches Render's environment

### Port Binding Issues

**Error:** `Web service failed to bind to $PORT`

**Solution:**
- Ensure Start Command uses `--port $PORT`
- Verify webapp-runner is downloaded correctly

---

## Post-Deployment

### Enable Auto-Deploy

Render automatically deploys when you push to your connected branch. To configure:

1. Go to your Web Service → **Settings**
2. Check **Auto-Deploy** is enabled
3. Every push to `main` will trigger a new deployment

### Monitor Logs

View real-time logs:
1. Go to your Web Service
2. Click **Logs** tab
3. Monitor for errors or database connection issues

### Add Custom Domain (Optional)

1. Go to Web Service → **Settings**
2. Scroll to **Custom Domain**
3. Add your domain (e.g., `lifechroncles.com`)
4. Follow DNS configuration instructions

---

## Security Recommendations (Before Public Launch)

⚠️ **IMPORTANT:** The current version stores passwords in **plaintext**. Before going public:

1. **Implement password hashing** (BCrypt recommended)
2. **Add CSRF protection** to all forms
3. **Enable HTTPS** (Render provides this automatically)
4. **Add rate limiting** for login/signup

See `render_deployment_review.md` for detailed security hardening steps.

---

## Cost Estimate

- **PostgreSQL (Free Tier)**: $0/month (with limitations)
- **Web Service (Free Tier)**: $0/month (spins down after 15 min of inactivity)
- **PostgreSQL (Starter)**: $7/month (recommended for production)
- **Web Service (Starter)**: $7/month (always on, better performance)

---

## Support

- **Render Documentation**: https://render.com/docs
- **Render Community**: https://community.render.com
- **PostgreSQL Docs**: https://www.postgresql.org/docs/

---

## Quick Reference

**Useful Render Commands:**

```bash
# View logs in real-time
render logs -f <service-name>

# Connect to PostgreSQL
PGPASSWORD=<password> psql -h <host> -U <user> -d <database>

# Check tables
\dt

# View table structure
\d "user"
\d story
```

---

**Deployment Complete!** 🚀

Your Life Chronicles application is now live on Render.
