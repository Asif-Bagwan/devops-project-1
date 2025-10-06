bucket_name = "dev-proj-1-remote-state-bucket-143"
name        = "environment"
environment = "dev-1"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["eu-central-1a", "eu-central-1b"]

public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGDtgZYfT8hUbpKa50xTdMmjKQrRTWAxAeRrCUtnrOke asif01_bagwan@rediffmail.com"
ec2_ami_id = "ami-0a116fa7c861dd5f9"

user_data_install_apache = <<-EOF
#! /bin/bash
cd /home/ubuntu
yes | sudo apt update
yes | sudo apt install python3 python3-pip -y
git clone https://github.com/Asif-Bagwan/python-mysql-db-proj-1.git
sleep 20
cd python-mysql-db-proj-1
pip3 install -r requirements.txt
echo 'Waiting for 30 seconds before running the app.py'
setsid python3 -u app.py &
sleep 30
EOF

domain_name = "devopswithasif.info"
