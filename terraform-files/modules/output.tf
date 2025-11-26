output "jenkins_server_ip" {
    value = aws_instance.jenkins-server.public_ip
    description = "Public IP address of the Jenkins server"
}

output "jenkins_agent_ip" {
    value = aws_instance.jenkins-agent.public_ip
    description = "Public IP address of the Jenkins server"
}