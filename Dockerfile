FROM python:3.11-slim

# Create app directory
RUN mkdir /app

# Set the working directory in the container
WORKDIR /app

# Define environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/usr/local/bin:$PATH"

# Upgrade pip and install pipenv
RUN pip install --upgrade pip pipenv

RUN pip list

# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application with gunicorn
CMD ["pipenv", "run", "gunicorn", "test_project.wsgi:application", "--bind", "0.0.0.0:8000"]