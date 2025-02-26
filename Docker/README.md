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

This `docker-compose.yml` file sets up a basic multi-container application with a Flask app and a database. It defines the services, their dependencies, environment variables, and volumes for data persistence. The inclusion of port mapping on the web-app service allows for direct access to the Flask application from the host machine, enabling initial testing and verification of the application's functionality.

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


# What does flask-app.py do?
---
This Python code creates a simple web application using **Flask**, a lightweight web framework, and connects to a **MySQL** database using the `MySQLdb` library. Here's what the code does:

### Breakdown of the code:

1. **Imports**:
   - `Flask` is imported to create the web application.
   - `MySQLdb` is imported to interact with the MySQL database.

2. **Flask Application Setup**:
   - `app = Flask(__name__)`: Initializes the Flask app, which allows it to handle HTTP requests.

3. **Route Definition**:
   - `@app.route('/')`: Defines a route for the root URL (`/`). When a user visits the root URL, the function `hello_world()` is called.

4. **Database Connection**:
   - Inside the `hello_world()` function, the code connects to a MySQL database using the `MySQLdb.connect()` method.
   - `host="mydb"` specifies the hostname of the MySQL server, which is set to `mydb` (likely the name of the MySQL container or service defined in a Docker Compose setup).
   - `user="root"`: Specifies the MySQL root username.
   - `passwd="my-secret-pw"`: Specifies the root password for MySQL.
   - `db="mysql"`: Specifies the name of the database to connect to.

5. **Database Query**:
   - A cursor object (`cur`) is created to interact with the database.
   - `cur.execute("SELECT VERSION()")`: Executes an SQL query to fetch the MySQL server version.
   - `version = cur.fetchone()`: Fetches the result of the query (the MySQL version).
   
   However, the fetched version is not used in the output, and this part doesn't impact the response that is returned to the user.

6. **Response**:
   - The function returns a simple greeting message: `f"Hello, Welcome to Zak's app"`. This is the message that will be displayed when you visit the root URL (`/`).

7. **Running the Application**:
   - `if __name__ == '__main__':`: Ensures the app runs only when this script is executed directly (not when it's imported as a module).
   - `app.run(host='0.0.0.0', port=5002)`: Starts the Flask app, making it accessible from any IP address (`0.0.0.0`) on port `5002`.

### Summary:
This script creates a Flask-based web application that connects to a MySQL database. When a user accesses the root URL (`/`), the server responds with a simple greeting message. Although the database connection and query are established, the fetched version of MySQL is not used in the response. The application is set to run on port `5002` and is accessible externally due to the host being set to `0.0.0.0`.

1. **Import Libraries**: `Flask` is imported to create the web application abd `MySQLdb` is imported to interact with the MySQL database.
2. **Flask Application Setup**: `app = Flask(__name__):` Initializes the Flask app, which allows it to handle HTTP requests.
3. **Route Definition**: `@app.route('/')`: Defines a route for the root URL `(/)`. When a user visits the root URL, the function `hello_world()` is called.
4. **Database Connection**:
   - Inside the `hello_world()` function, the code connects to a MySQL database using the `MySQLdb.connect()` method.
   - `host="mydb"` specifies the hostname of the MySQL server, which is set to `mydb`.
   - `user="root"`: Specifies the MySQL root username.
   - `passwd="my-secret-pw"`: Specifies the root password for MySQL.
   - `db="mysql"`: Specifies the name of the database to connect to.
5. **Database Query**
 - A cursor object (`cur`) is created to interact with the database.
 - `cur.execute("SELECT VERSION()")`: Executes an SQL query to fetch the MySQL server version.
 - `version = cur.fetchone()`: Fetches the result of the query (the MySQL version).
   However, the fetched version is ignored in the output and doesn't impact what's returned to the user.
6. **Response**: 
- The function returns a simple greeting message: `f"Hello, Welcome to Zak's app"`. This is the message that will be displayed when you visit the root URL (`/`).
7. Running the Application:
  - `if __name__ == '__main__':`: Ensures the app runs only when this script is executed directly.
  - `app.run(host='0.0.0.0', port=5002)`: Starts the Flask app, making it accessible from any IP address (0.0.0.0) on port 5002.
