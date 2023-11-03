#!/bin/bash

# Update the system and install required packages
sudo yum update -y
sudo yum install -y python3 httpd
sudo yum install -y python3-pip
sudo pip3 install Flask

# Python script for downloading, extracting, and serving files
cat << EOF > /tmp/download_extract_server.py
import os
import subprocess
import urllib.request
import zipfile
from flask import Flask, send_file

# URL to download the ZIP file
ZIP_URL = 'https://testzh11.s3.eu-central-1.amazonaws.com/LPI-Learning-Material.zip'

# Local directory to store the downloaded and extracted files
DOWNLOAD_DIR = '/tmp'
ZIP_FILE_PATH = os.path.join(DOWNLOAD_DIR, 'LPI-Learning-Material.zip')
EXTRACT_DIR = os.path.join(DOWNLOAD_DIR, 'extracted')

# Download the ZIP file
urllib.request.urlretrieve(ZIP_URL, ZIP_FILE_PATH)

# Extract the contents of the ZIP file
with zipfile.ZipFile(ZIP_FILE_PATH, 'r') as zip_ref:
    zip_ref.extractall(EXTRACT_DIR)

# Create a Flask web app
app = Flask(__name__)

# Serve the extracted files via HTTP
@app.route('/files/<filename>')
def serve_file(filename):
    file_path = os.path.join(EXTRACT_DIR, filename)
    return send_file(file_path, as_attachment=True)

# Start the Flask app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
EOF

# Run the Python script
sudo python3 /tmp/download_extract_server.py