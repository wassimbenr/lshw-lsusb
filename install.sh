#!/bin/bash
# installing requirment
if ! command -v yad &>/dev/null; then
    echo "---------- Requirment-------------------"
    echo "*yad Not found"
    echo "installing wait"
    sudo apt install yad
fi
sudo mkdir /usr/bin/projet
FILE="projet.sh"
FILE_G="menu_graphique.sh"
HELP="help.txt"
echo "INSTALLING ..."
sudo cp $FILE /usr/bin/
sudo cp $FILE_G /usr/bin/
sudo cp $HELP /etc
echo "Almost done"
echo "setting file permission"
sudo chmod 777 "/usr/bin/projet.sh"
sudo chmod 777 menu_graphique.sh
sudo chmod 777 "/usr/bin/menu_graphique.sh"
echo "all set"
