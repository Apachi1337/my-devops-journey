# Use Python 3.8 slim as the base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app



# Copy the current directory (.) contents into the container at /app
COPY . /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/requirements.txt

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install system dependencies required for mysqlclient (MariaDB version)
RUN apt-get update && \
    apt-get install -y pkg-config libmariadb-dev build-essential && \
    rm -rf /var/lib/apt/lists/*


# Expose the Flask port
EXPOSE 5002

# Run the Flask app
CMD ["python", "app.py"]
