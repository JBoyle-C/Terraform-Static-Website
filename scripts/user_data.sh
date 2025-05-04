#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "Hello from ASG" > /var/www/html/index.html
