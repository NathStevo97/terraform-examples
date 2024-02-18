#!/bin/bash
echo =======================================================
echo		Installing dependencies
echo ========================================================
#git installation
sudo apt-get install -y git
#python 2.7 install
sudo apt install -y python2.7 python-pip
#pip module installations
pip install flask flask_socketio

echo ======================================================
echo		CLONING GIT REPOSTORY
echo ======================================================
git clone https://github.com/NathStevo97/Python_Flask_Chat_App
echo ======================================================
echo 		WRITING SERVICE FILE
echo ======================================================
echo "
[Unit]
Description=Flask Chat Application
After=network.target

[Service]
User=terraform
WorkingDirectory=/home/terraform/Python_Flask_Chat_App
ExecStart=/usr/bin/python2.7 /home/terraform/Python_Flask_Chat_App/main.py -b 0.0.0.0:5000

[Install]
WantedBy=multi-user.target
">>flaskChat.service
sudo chmod +777 /home/terraform/Python_Flask_Chat_App/main.py
#create symlink for service file
sudo ln -s /home/terraform/flaskChat.service /etc/systemd/system/flaskChat.service

echo =============================================================
echo 			RELOADING SYSTEM
echo =============================================================
sudo systemctl start flaskChat.service
sudo systemctl daemon-reload
