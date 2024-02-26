#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install nginx
echo '<h1>Hello World from $(hostname -f)<h1>' | sudo tee /var/www/html/index.html
sudo service nginx start