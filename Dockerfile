# Use a Python 3 base image
FROM python:3.9-alpine

# Install system dependencies, including ca-certificates for SSL
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev ca-certificates

# Ensure certificates are up-to-date
RUN update-ca-certificates

# Set the working directory
WORKDIR /usr/src/app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application and template files
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Expose the port the app will run on
EXPOSE 5000

# Set the default command to run the application
CMD ["python", "/usr/src/app/app.py"]

