#!/bin/bash

CYAN="\033[0;36"
GREEN="\033[0;32m"

echo -e "${CYAN} Updateing."
sudo apt-get update -y && apt-get upgrade -y

sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo -e "${GREEN} Finished updating."

echo -e "${CYAN} Installing Git, NodeJs, MongoDB."
sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y mongodb
echo -e "${GREEN} Finished Installing."

echo -e "${CYAN} Installing API Service."
sudo cp ./poolapi.service /etc/systemd/system/
sudo systemctl daemon-reload
echo -e "${GREEN} Finished installing API Service."

echo -e "${CYAN} Cloning GIT repo."
sudo git clone https://github.com/DimitriosKan/TeamB_Pool_Project_API.git

echo -e "${CYAN} Moving project to base.."
sudo mv TeamB_Pool_Project_API/ ../TeamB_Pool_Project_API/

echo -e "${CYAN} CD into project."
sudo cd TeamB_Pool_Project_API

echo -e "${CYAN} Checking into Developer."
sudo git checkout Developer
sudo npm install

sudo systemctl start jenkins