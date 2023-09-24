#!/bin/bash
echo =======================================================
echo		Installing dependencies
echo ========================================================
sudo apt-get update
sudo apt-get install -yq build-essential python3-pip rsync
pip install flask

echo ======================================================
echo 		WRITING SERVICE FILE
echo ======================================================
echo "
[Unit]
Description=Basic Flask Server
After=network.target
[Service]
User=natstephenson15
WorkingDirectory=/home/natstephenson15
ExecStart=/usr/bin/python3 /home/natstephenson15/app.py
[Install]
WantedBy=multi-user.target
">>flaskServer.service
sudo chmod +777 /home/natstephenson15/app.py
#create symlink for service file
sudo ln -s /home/natstephenson15/flaskServer.service /etc/systemd/system/flaskServer.service

echo =============================================================
echo 			RELOADING SYSTEM
echo =============================================================
sudo systemctl start flaskServer.service
sudo systemctl daemon-reload