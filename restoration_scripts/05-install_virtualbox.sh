#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

output::h1 "Installing VirtualBox"

sudo apt update

output::h2 "Add VirtualBox repository"
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor >oracle_vbox_2016.gpg
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor >oracle_vbox.gpg
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/

rm -f oracle_vbox_2016.gpg
rm -f oracle_vbox.gpg

$ echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

output::h2 "Installing VirtualBox from repository"
sudo apt update
sudo apt install -y linux-headers-"$(uname -r)" dkms
sudo apt install virtualbox-7.0 -y

output::h1 "VirtualBox installed"
