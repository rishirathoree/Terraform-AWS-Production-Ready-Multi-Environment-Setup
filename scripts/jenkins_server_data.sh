# This file is used to set the user data for the EC2 instance
#!/bin/bash

echo "Setting up user data for EC2 instance..."

# Install JAVA
sudo apt -y update
sudo apt -y install fontconfig openjdk-21-jre
java -version

# Install Jenkins
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt -y update
sudo apt -y install jenkins

# Check Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


sudo ufw allow 8080
sudo ufw allow 80
sudo ufw allow 22
sudo ufw allow 9000
sudo ufw allow 5173
sudo ufw enable