#!/bin/bash
yum install httpd -y
cd /var/www/html
echo "DEVOPS-TERRAFORM" > index.html
service httpd start
service httpd enable
chconfig httpd