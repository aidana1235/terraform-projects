#!/bin/bash
yum install httpd -y
cd /var/www/html
echo "DEVX-TEAM-1" > index.html
systemctl start httpd
systemctl enable httpd

