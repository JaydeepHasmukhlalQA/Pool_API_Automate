#!/bin/bash

sudo apt-get update -y && apt-get upgrade -y

sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y mongodb

sudo cp ./poolapi.service /etc/systemd/system/
sudo systemctl daemon-reload

sudo git clone https://github.com/DimitriosKan/TeamB_Pool_Project_API.git
sudo mv TeamB_Pool_Project_API/ ../TeamB_Pool_Project_API/
sudo cd TeamB_Pool_Project_API
sudo git checkout Developer
sudo npm install

sudo systemctl daemon-reload