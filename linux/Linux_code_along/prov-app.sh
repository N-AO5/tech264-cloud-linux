#!/bin/bash


GITHUB_REPO="https://github.com/N-AO5/tech264-sparta-app.git"


echo update sources list...
sudo apt update -y
echo Done.

echo upgrade any upgradable packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done.

echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done.

#find and replace proxy pass line
echo nginx reverse proxy configuration...
sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo Done.

echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!


#install pm2 - package manager to run app in background
echo installing pm2...
sudo npm install -g pm2
echo Done !

echo check nodejs version...
node -v
echo Done!

MONGODB_HOST="mongodb://10.0.3.4:27017/posts"

echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB_HOST
echo "Connection complete."
echo "Set env variable"
printenv DB_HOST
echo "env variable set."

echo Cloning GitHub repository...
git clone $GITHUB_REPO repo
echo Done !

echo cd into the app file
cd repo/app
echo now into the app file

echo npm install
npm install
echo npm install done

#running the app using pm2
echo run the app in the background using pm2
pm2 start npm node.js
echo all done!
