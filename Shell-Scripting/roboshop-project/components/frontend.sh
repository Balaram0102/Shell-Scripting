#The frontend is the service in RobotShop to serve the web content over Nginx.
#
#To Install Nginx.
#
## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx
#Let's download the HTDOCS content and deploy under the Nginx path.
#
## curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#Deploy in Nginx Default Location.
#
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/* .
## mv static/* .
## rm -rf frontend-master README.md
## mv localhost.conf /etc/nginx/default.d/roboshop.conf
#Finally restart the service once to effect the changes.
#
## systemctl restart nginx
rm -f $LOG_FILE
LOG_FILE=/tmp/roboshop.log
rm -f /etc/yum.repos.d/endpoint.repo
echo "installing nginx"
yum install nginx -y >> $LOG_FILE
echo " Downloading frontend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>> $LOG_FILE
echo "cleaning old content"
rm -rf /usr/share/nginx/html/* $LOG_FILE
echo "Extracting Frontend Content"
cd /tmp
unzip /tmp/frontend.zip $LOG_FILE

cp -r frontend-main/* /usr/share/nginx/html/ &>>$LOG_FILE
cp rontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
echo "Starting Nginx"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE