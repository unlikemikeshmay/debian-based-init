#!/bin/bash

pass="1221"
echo $pass

#remove packages
echo "removing packages golang, nodejs, git..."

echo "removing archive files"
echo $pass | sudo -S apt autoclean

#remove snap packages

echo "removing snap packages goland, heroku, code"
echo $pass | sudo snap remove go node git-ubuntu goland heroku code
echo $pass | sudo rm -R ~/Code
echo $pass | sudo rm -R ~/go
