#!/bin/bash

CYAN="\033[0;36"
GREEN="\033[0;32m"
DEFULT="\e[39mDefault"
BLINK="\e[5mBlink"
NOBLINK="\e[25mNormal"

echo -e "${BLINK}${CYAN}Updateing.${DEFULT}${NOBLINK}"
sudo apt-get update -y && apt-get upgrade -y

sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo -e "${BLINK}${GREEN} Finished updating.${DEFULT}${NOBLINK}"

echo -e "${BLINK}${CYAN} Installing Git, NodeJs, MongoDB.${DEFULT}${NOBLINK}"
sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y mongodb
echo -e "${BLINK}${GREEN} Finished Installing.${DEFULT}${NOBLINK}"

echo -e "${BLINK}${CYAN} Installing API Service.${DEFULT}${NOBLINK}"
sudo cp ./poolapi.service /etc/systemd/system/
sudo systemctl daemon-reload
echo -e "${BLINK}${GREEN}Finished installing API Service.${DEFULT}${NOBLINK}"

echo -e "${BLINK}${CYAN}Cloning GIT repo.${DEFULT}${NOBLINK}"
sudo git clone https://github.com/DimitriosKan/TeamB_Pool_Project_API.git

echo -e "${BLINK}${CYAN}Moving project to base.${DEFULT}${NOBLINK}"
sudo mv TeamB_Pool_Project_API/ ../TeamB_Pool_Project_API/

echo -e "${BLINK}${CYAN}CD into project.${DEFULT}${NOBLINK}"
cd ..
cd TeamB_Pool_Project_API

echo -e "${BLINK}${CYAN}Checking into Developer."
sudo git checkout Developer
sudo npm install

echo -e "${BLINK}${CYAN}Starting poolapi.service.${DEFULT}${NOBLINK}"
sudo systemctl start poolapi