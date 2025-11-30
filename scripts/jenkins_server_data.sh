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

# Install Docker
sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# Check Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Install Sonarqube
docker run -d --name sonar -p 9000:9000 sonarqube:latest

# Install Trivy
sudo apt-get -y update
sudo apt-get -y install wget apt-transport-https gnupg -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb focal main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get -y update
sudo apt-get install trivy -y

