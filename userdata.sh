#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo wget https://www.apachefriends.org/xampp-files/8.1.2/xampp-linux-x64-8.1.2-0-installer.run
sudo chmod 755 xampp-linux-x64-8.1.2-0-installer.run
Y
Y
ENTER
Y
sudo apt install net-tools
sudo /opt/lampp/lampp start
