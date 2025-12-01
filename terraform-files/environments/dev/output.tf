output "jenkins_server_ip" {
    value = module.aws-app.jenkins_server_ip
    description = "Public IP address of the Jenkins server"
}

output "jenkins-agent-ip" {
    value = module.aws-app.jenkins-agent-ip
    description = "Public IP address of the Jenkins server"
}