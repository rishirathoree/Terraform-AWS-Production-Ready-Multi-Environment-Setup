output "jenkins_server_ip" {
    value = aws_instance.jenkins-server.public_ip
    description = "Public IP address of the Jenkins server"
}

output "dev-webserver-ip" {
    value = aws_instance.dev-webserver.public_ip
    description = "Public IP address of the Jenkins server"
}

output "staging-webserver-ip" {
    value = aws_instance.staging-webserver.public_ip
    description = "Public IP address of the Jenkins server"
}

output "prod-webserver-ip" {
    value = aws_instance.prod-webserver.public_ip
    description = "Public IP address of the Jenkins server"
}