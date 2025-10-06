#! /bin/bash
# Update system and install dependencies
yes | sudo apt update
yes | sudo apt install -y python3 python3-venv python3-pip git

# Move to home directory
cd /home/ubuntu

# Clone your app repository
git clone https://github.com/Asif-Bagwan/python-mysql-db-proj-1.git
sleep 20

cd python-mysql-db-proj-1

# Create a virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install required Python packages
pip install -r requirements.txt

# Run the Flask app in background and log output
echo 'Starting Flask app on port 5000...'
setsid python app.py > app.log 2>&1 &

sleep 30
