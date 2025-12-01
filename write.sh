dev 

Jenkins Server
13.203.76.60

Agent
3.110.185.5

Jenkins Server
ssh -i mykey ubuntu@13.203.76.60

Agent
ssh -i mykey ubuntu@3.110.185.5

cd ~/.ssh

sudo cat /var/lib/jenkins/secrets/initialAdminPassword  

http://13.203.76.60:8080/

admin
4f088487a5a54eb9bb3948f4171402c6

agent label : jenkins-dev-agent

http://13.203.76.60:8080/github-webhook/

Library Shared Name : shared-groovy

http://3.110.185.5:5173

docker run -d --name sonar -p 9000:9000 sonarqube:latest
http://13.203.76.60:9000/

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
