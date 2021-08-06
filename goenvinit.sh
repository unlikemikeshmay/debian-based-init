#!/bin/bash

pass="1221"
GREEN='\033[1;32'
RED='\033[0;31m'
NC='1;32'
DIR="~/Code"
GO_DIR="/home/mike/go/src/github.com/"

echo $pass | sudo -S apt update

#install with snap
echo "installing goland, heroku , code with snap..."
echo $pass | sudo -S  snap install go --classic
echo $pass | sudo -S  snap install node --classic
echo $pass | sudo -S  snap install git-ubuntu --classic
echo $pass | sudo -S  snap install goland --classic
echo $pass | sudo -S  snap install heroku --classic 
echo $pass | sudo -S  snap install code --classic
echo " "
#install with apt
echo "installing  golang, nodejs, git, vim, with apt...."
echo " "
echo $pass | sudo -S apt install vim

git config --global user.email "michael.a.t.jay@gmail.com"
git config --global user.name "mike"
git config --global user.password "L@mbofsilence1"

if [ "$?" = "0" ]; then
echo -e "${GREEN}packages installed without error.${NC}"
echo " "
echo -e "${GREEN}creating project directory and cloning project...${NC}"
else
	echo -e "${RED}packages failed to install with error: ${NC} after initial dependency download" 1>&2
fi

# create preferred go directory and install project
if [ -d "${GO_DIR}" ]; then 
	printf "${GO_DIR} exists already..."
else
echo "make dir /home/mike/go/src/github.com"
echo $pass | sudo mkdir ~/go/src/github.com/

echo "cloning trackerBackEnd into ${GO_DIR}"
echo $pass | sudo -S git clone https://github.com/unlikemikeshmay/trackerBackEnd.git ~/go/src/github.com


if [ "$?" = "0" ]; then
	echo -e "${GREEN} Project cloned successfully! ${NC}"
else
echo -e "${RED}packages failed to install with error: after git backend clone. ${NC}" 1>&2
fi
if [ -d "${DIR}" ]; then
	echo -e "${RED}directory already exists${NC}"
	echo $pass | sudo -S  git clone https://unlikemikeshmay:L@mbofsilence1@github.com/unlikemikeshmay/trackerClient.git ~/Code
else
echo "cloning tracker client"
echo $pass | sudo mkdir ~/Code
echo $pass | sudo -S  git clone https://github.com/unlikemikeshmay/trackerClient.git ~/Code
fi
#npm install

fi
