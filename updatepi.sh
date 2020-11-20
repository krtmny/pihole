#!/bin/sh
sudo apt update -y
sudo apt full-upgrade -y
sudo apt-get -y --purge autoremove
sudo apt clean -y
sudo apt autoclean -y
sudo reboot
