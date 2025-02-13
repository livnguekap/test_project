# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Create app directory
RUN mkdir /app

# Set the working directory in the container
WORKDIR /app

# Define environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Upgrade pip
RUN pip install --upgrade pip pipenv


# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application with Gunicorn
CMD ["./startup.sh"]