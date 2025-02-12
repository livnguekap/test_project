# Use an official Python runtime as a parent image
FROM python:3.11-slim

# create app directory
RUN mkdir /app

# Set the working directory in the container
WORKDIR /app

# Define environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Upgrade pip
RUN pip install --upgrade pip

#copy Django project and install depencencies
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "cake_project.wsgi:application"]
