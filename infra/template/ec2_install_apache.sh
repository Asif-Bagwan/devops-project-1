#! /bin/bash

# Update the system package list so apt knows about the latest versions
yes | sudo apt update

# Install Python and pip (the package installer for Python)
# 'yes |' automatically confirms 'Y' to apt prompts
yes | sudo apt install -y python3 python3-pip git

# Move to the home directory of ubuntu user
cd /home/ubuntu

# Clone your Flask application repo from GitHub
git clone https://github.com/Asif-Bagwan/python-mysql-db-proj-1.git

# Wait for 20 seconds to make sure repo is cloned properly before proceeding
sleep 20

# Go inside the cloned project folder
cd python-mysql-db-proj-1

# Install all dependencies listed in requirements.txt
# '--break-system-packages' is added because Ubuntu 24.04 blocks pip installs globally
sudo pip3 install -r requirements.txt --break-system-packages

# Print a message to logs — just for debugging
echo 'Waiting for 30 seconds before running the app.py'

# Start the Flask app in background using setsid (detaches from terminal)
# The '-u' makes Python unbuffered (real-time logs)
# '&' sends it to background so the script can finish
setsid python3 -u app.py > app.log 2>&1 &

# Wait for 30 seconds to ensure the app starts and binds to port 5000
sleep 30
