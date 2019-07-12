CYAN="\033[0;36"
GREEN="\033[0;32m"
DEFULT="\e[39mDefault"
BLINK="\e[5mBlink"
NOBLINK="\e[25mNormal"

echo -e "${BLINK} ${CYAN} Removing Files. ${DEFULT} ${NOBLINK}"
sudo systemctl stop poolapi
sudo systemctl disable poolapi

sudo rm -fR ../poolmanager-api
sudo rm -fR /etc/systemd/system/poolapi.service