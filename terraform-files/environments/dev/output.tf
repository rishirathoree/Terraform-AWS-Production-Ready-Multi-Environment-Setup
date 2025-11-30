output "jenkins_server_ip" {
    value = module.aws-app.jenkins_server_ip
    description = "Public IP address of the Jenkins server"
}
output "dev-webserver-ip" {
    value = module.aws-app.dev-webserver-ip
    description = "Public IP address of the Jenkins server"
}

output "staging-webserver-ip" {
    value = module.aws-app.staging-webserver-ip
    description = "Public IP address of the Jenkins server"
}

output "prod-webserver-ip" {
    value = module.aws-app.prod-webserver-ip
    description = "Public IP address of the Jenkins server"
}