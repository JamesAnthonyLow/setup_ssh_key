#!/bin/bash

USERNAME=$1
PASSWORD=$2
KEYNAME=$3
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -C "jamesalowenthal@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
curl -u "$USERNAME:$PASSWORD" --data "{\"title\":\"$KEYNAME\",\"key\":\"$(xclip -sel clip -o)\"}" https://api.github.com/user/keys
