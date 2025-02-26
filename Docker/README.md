# Flask App using Docker Compose
---
This is a simple project that demonstrated using a Python Flask web application orchestrated with Docker Compose.

# Project Setup
---

First things first, we need to setup project directory and create the required files.

1. **Create the Project Directory**
     ``` bash
     mkdir Docker/hello_flask
     cd Docker/hello_flask

2. **Create Files:**

   Create the following files in your directory
   - `Dockerfile`
   - `flask-app.py`
   - `docker-compose.yml`
   - `requirements.txt`
  
   These files can be created using the touch command:
   ``` bash
   touch Dockerfile flask-app-py docker-compose.yml requirements.txt
   ```

# What does Dockerfile do?
---
The `Dockerfile` is used to build the Docker image for the Flask application. Here's a breakdown:

1. **Base Image:**
   ``` bash
   FROM python:3.8-slim
   ```
   - This is specifying what the base image for our Docker will be. We are using Python 3.8 slim. The slim version is used as the image size is reduced.
  
2. **Working Directory**
   ``` bash
   WORKDIR /app
   ```
   - This is setting the working directory inside the container to `/app`.
  
3. **Install dependencies:**
   ``` bash
   RUN pip install --no-cache-dir -r requirements.txt
   ```
   ``` bash
    RUN apt-get update && \
    apt-get install -y pkg-config libmariadb-dev build-essential && \
    rm -rf /var/lib/apt/lists/*
   ```
   - The first run command uses `pip` which is the Python package installer to install the Flask libraries. The 2nd run command is for installing the dependencies needed for our `mysqlclient`. I kept running into issues before where the database would not build properly so this fixes that problem.
