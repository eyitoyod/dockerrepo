# Use a Python 3 base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Set the default command to run the application
CMD ["python", "app.py"]
