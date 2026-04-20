FROM python:3.10-slim 
WORKDIR /application
COPY . /application

RUN apt update -y && apt install awscli -y

# Install system dependencies in one layer
RUN apt-get update && apt-get install -y \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

    
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


CMD ["python", "application.py"]

