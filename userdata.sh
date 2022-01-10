#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install awscli -y
sudo apt-get install apache2 -y
sudo chmod -R 777 /var/www/html
 aws s3 cp s3://demo-s3-697613968254/index11.html /var/www/html/index.html
