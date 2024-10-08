# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY flask_app.py .

# Expose the port that the app runs on
EXPOSE 8001

# Command to run the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8001", "flask_app:app"]
