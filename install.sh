#!/bin/bash

CYAN="\033[0;36"
GREEN="\033[0;32m"
DEFULT="\e[39mDefault"

echo -e "${CYAN} Installing Git, NodeJs.${DEFULT}"
sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y git
sudo apt-get install -y nodejs
echo -e "${GREEN} Finished Installing.${DEFULT}"

echo -e "${CYAN} Installing API Service.${DEFULT}"
sudo cp ./poolapi.service /etc/systemd/system/
sudo systemctl daemon-reload
echo -e "${GREEN}Finished installing API Service.${DEFULT}"

echo -e "${CYAN}Cloning GIT repo.${DEFULT}"
sudo git https://github.com/yamileon/poolmanager-api.git

echo -e "${CYAN}Moving project to base.${DEFULT}"
sudo mv poolmanager/ ../poolmanager/

echo -e "${CYAN}CD into project.${DEFULT}"
cd ../poolmanager

echo -e "${CYAN}Checking into Developer."
sudo git checkout Developer
yes | sudo npm install

echo -e "${CYAN}Starting poolapi.service.${DEFULT}"
sudo systemctl start poolapi
