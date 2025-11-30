dev 

Jenkins Server
15.206.148.19

Agent
13.233.100.242

Jenkins Server
ssh -i mykey ubuntu@15.206.148.19

Agent
ssh -i mykey ubuntu@13.233.100.242

cd ~/.ssh

sudo cat /var/lib/jenkins/secrets/initialAdminPassword  

http://15.206.148.19:8080/

admin
289a1d585fb24e3f95245264bb4aa3af

agent label : jenkins-dev-agent

http://15.206.148.19:8080/github-webhook/

Library Shared Name : shared-groovy

http://13.233.100.242:5173

docker run -d --name sonar -p 9000:9000 sonarqube:latest
http://15.206.148.19:9000/

==================
ssh-keygen -t rsa -b 4096 -C "jenkins-key" -f ~/.ssh/jenkins
==================

 git add .
 git commit -m "added changes"
 git push origin main

# Add Duckerhub Credential in Jenkins
# Add Github Repo
# Add Jenkins Server Private Key In Credential to access the jenkins agent
# Add Github Webhook in Jenkins to jenkins server ip http://yourip:jenkinport/github-webhooks/
# Add Stage View Plugin
# Add Github Branch Source Plugin
