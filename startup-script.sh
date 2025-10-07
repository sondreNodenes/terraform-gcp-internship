#!/bin/bash

apt-get update

# Install nginx and certbot
apt-get install -y nginx certbot python3-certbot-nginx

#HTML File with greeting
cat > /var/www/html/index.html <<HTML
<!DOCTYPE html>
<html>
<head>
    <title> px internship </title>
</head>
<body>
  <h1>Hello from Sondre Nodenes!</h1>
</body>
</html>
HTML

#Start and enable nginx
systemctl start nginx
systemctl enable nginx

#Sleep 10 seconds so that nginx is fully ready
sleep 10 

certbot --nginx -d sondrenodenes.sandbox4x.vcops.tech --non-interactive --agree-tos --email sondrenf@gmail.com --redirect
