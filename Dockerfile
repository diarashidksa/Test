# Use a lightweight official Python image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt ./

# Install Flask and Gunicorn
RUN pip install --no-cache-dir Flask gunicorn

# Copy the rest of the application code
COPY . .

# Expose the port on which the app will run
EXPOSE 5000

# Define the command to start the application using Gunicorn
CMD gunicorn --bind 0.0.0.0:$PORT app:app