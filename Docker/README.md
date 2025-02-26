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
   ``` dockerfile
   FROM python:3.8-slim
   ```
   - This is specifying what the base image for our Docker will be. We are using Python 3.8 slim. The slim version is used as the image size is reduced.
  
2. **Working Directory**
   ``` dockerfile
   WORKDIR /app
   ```
   - This is setting the working directory inside the container to `/app`.
  
3. **Copy Application files:**
   ``` dockerfile
   COPY . /app
   ```
   - Copies all files and directories from the current directory to the `/app` directory inside the container. This includes your `flask-app.py` and any other files that are needed.
   - 
  
4. **Install dependencies:**
   ``` dockerfile
   RUN pip install --no-cache-dir -r requirements.txt
   ```
   ``` dockerfile
    RUN apt-get update && \
    apt-get install -y pkg-config libmariadb-dev build-essential && \
    rm -rf /var/lib/apt/lists/*
   ```
   - The first run command uses `pip` which is the Python package installer to install the Flask libraries. The 2nd run command is for installing the dependencies needed for our `mysqlclient`. I kept running into issues before where the database would not build properly so this fixes that problem.
  
5. **Expose the Port:**
   ``` dockerfile
   EXPOSE 5002
   ```
   - This port 5002 which lets Docker know that the container will be listening on this port during runtime.

6. **Command that runs the Application:**

   ``` dockerfile

   CMD ["python", "app.py"]
   ```
   - This specifies the command that will be executed when the container starts.

# What does docker-compose.yml do?
---

The `docker-compose.yml` file defines and manages the services in our application.

1. Services Definition:
   ``` yaml
   services:
   ```
   - This section defines the containers (or services) that are part of the application.
  
2. **Flask App Service** (`web-app`):
   ``` yaml
   web:
    build: .
    ports:
      - "5002:5002"
    depends_on:
      - mydb
   
      ```
   - `web-app`: Name of our Flask application service
   - `build: .`: Tells Docker Compose to build the image for this service using the `Dockerfile` in the current directory.
   - `ports: - 5002:5002`: Maps port 5002 on the host machine to port 5002 in the container. This means you can access the app from your browser.
   - `depends_on - mydb`: This indicated that the `web` services depends on the `mydb` services, so the `mydb` service will be started before the `web` service. 

```  yaml
mydb:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw
```
- `mydb`: The `mydb` service represents a container.
- `image: mysql:5.7`: This specifies that the `mydb` service will use the official MySQL Docker image version `5.7.`
- `environment`: This section defines the containers environment variables. In this case, its setting the MySQL root password.
- `MYSQL_ROOT_PASSWORD: my-secret-pw`: This sets the root password for the MySQL database to `my-secret-pw`.

  
