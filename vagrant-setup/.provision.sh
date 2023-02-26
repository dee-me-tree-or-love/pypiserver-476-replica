#!/bin/bash

apt-get -y update

# Install prerequisite services
apt-get -y install nginx python3 python3-dev python3-pip

# Make sure pypiserver==1.5.1 is installed and `passlib` is available
pip3 install pypiserver==1.5.1 passlib

# ~~~

# Prepare required folders
mkdir -p /tmp/packages

# Copy the pypiserver.conf to replace the default site
cp /tmp/pypiserver.conf /etc/nginx/sites-available/default
ls -la /etc/nginx/sites-enabled/
cat /etc/nginx/sites-enabled/default

# Copy the pypiserver service
cp /tmp/pypiserver.service /etc/systemd/system/pypiserver.service

# Copy the htpasswd
cp /tmp/.htpasswd /etc/nginx/.htpasswd

# ~~~~

# Enable pypiserver
systemctl enable pypiserver.service

# Check the nginx config
nginx -t
service nginx configtest

# Start both services
service pypiserver start
service nginx start