# NGINX Web Server Bootstrap

Instances in the Auto Scaling Group install and configure NGINX using a user-data script.

## Bootstrap Script

#!/bin/bash

dnf update -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx

sleep 10

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>Web Server Instance: $INSTANCE_ID</h1>" > /usr/share/nginx/html/index.html

## Result

Each server displays its EC2 instance ID on the webpage, allowing verification that the load balancer distributes traffic between instances.
