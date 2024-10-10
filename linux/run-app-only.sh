#!/bin/bash
 
GITHUB_REPO="https://github.com/N-AO5/tech264-sparta-app"
 
MONGODB_HOST="mongodb://10.0.3.5:27017/posts"
 
echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB_HOST
echo "Connection complete."
printenv DB_HOST
echo "env variable set."
 
echo cd into the app file
cd repo/app
echo now into the app file
 
# Stop any existing pm2 processes
echo stopping any running pm2 processes...
pm2 stop all
 
# Run the app
echo Run app...
pm2 start app.js
echo Done!