#!/bin/bash

# Function to validate commands
VALIDATE() {
  if [ $? -eq 0 ]; then
    echo "$2 succeeded"
  else
    echo "$2 failed"
    exit 1
  fi
}

# Install Docker
echo "Installing Docker..."
sudo yum install -y docker
VALIDATE $? "Installed docker components"

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker
VALIDATE $? "Started Docker service"

# Enable Docker service to start on boot
echo "Enabling Docker service to start on boot..."
sudo systemctl enable docker
VALIDATE $? "Enabled Docker service on boot"

# Install Docker Compose
echo "Downloading Docker Compose..."
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
VALIDATE $? "Downloaded Docker Compose"

# Make Docker Compose executable
echo "Setting execute permissions for Docker Compose..."
sudo chmod +x /usr/local/bin/docker-compose
VALIDATE $? "Set permissions for Docker Compose"

# Add ec2-user to the Docker group
echo "Adding ec2-user to the Docker group..."
sudo usermod -a -G docker ec2-user
VALIDATE $? "Added ec2-user to Docker group"

# Final message
echo "Docker and Docker Compose installation complete!"
