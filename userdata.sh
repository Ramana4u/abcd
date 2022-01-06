#!/bin/bash\n
sudo -i\n
apt-get update -y\n
apt-get upgrade -y\n
apt-get install apache2 -y\n
apt-get install awscli -y\n
cd /var/www/html\n
aws s3 cp s3://arn:aws:s3:us-east-2:697613968254:accesspoint/accesspoint11/index.html index11.html
