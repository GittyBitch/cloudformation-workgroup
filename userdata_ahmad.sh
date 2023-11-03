#!/bin/bash
sudo yum update -y
sudo yum install -y python3 python3-pip unzip

# Create a directory for your Python code in /var
CODE_DIR="/var/myapp"
sudo mkdir -p $CODE_DIR

# Download the Python code zip file from the S3 bucket
S3_URL="https://mainpythoncodebucket.s3.eu-central-1.amazonaws.com/main.zip"
wget $S3_URL -O "$CODE_DIR/main.zip"

# Unzip the code
cd $CODE_DIR
unzip main.zip

# Install any Python dependencies required by your code (if applicable)
# pip3 install -r $CODE_DIR/requirements.txt

# Run your main.py (replace with your specific Python code execution command)
python3 $CODE_DIR/main.py
