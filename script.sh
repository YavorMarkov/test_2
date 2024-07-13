#!/bin/bash

# Update package list and upgrade all packages
sudo apt-get update
sudo apt-get -y upgrade

# Install necessary packages
sudo apt-get install -y nginx git

# Clone a sample repository (optional, adjust as needed)
# git clone https://github.com/example/repo.git /var/www/html/repo

# Create a basic HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My VM</title>
</head>
<body>
    <h1>Welcome to My VM!</h1>
    <p>This VM is configured using a startup script.</p>
</body>
</html>
EOF

# Start Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Print a message indicating the script has finished
echo "Startup script has completed execution."
