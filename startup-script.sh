#!/bin/bash

apt-get update

# Install nginx
apt-get install -y nginx

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