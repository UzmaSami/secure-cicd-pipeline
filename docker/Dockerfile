# Use the official, lightweight Python 3.13 image
FROM python:3.13-slim

# Set a secure working directory inside the container
WORKDIR /app

# Copy the requirements file first (this makes future builds faster)
COPY app/requirements.txt .

# Install dependencies securely without caching junk files
RUN pip install --no-cache-dir -r requirements.txt

# Copy the actual application code into the container
COPY app/ .

# Expose port 5000 for the Flask app
EXPOSE 5000

# Command to run the application when the container starts
CMD ["python", "main.py"]