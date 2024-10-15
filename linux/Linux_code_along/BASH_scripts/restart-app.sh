#SSH into App
#Connect the `VM with SSH key`
#To see the `repo/app`- need to be in root directory 
cd /repo/app
export DB_HOST=mongodb://10.0.4.4:27017/posts
sudo -E pm2 start app.js