output "jenkins_server_ip" {
    value = module.aws-app.jenkins_server_ip
    description = "Public IP address of the Jenkins server"
}

output "jenkins_agent_ip" {
    value = module.aws-app.jenkins_agent_ip
    description = "Public IP address of the Jenkins agent server"
}