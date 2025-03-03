output "jenkins_ip" {
  description = "The public IP of the Jenkins instance"
  value       = module.jenkins.jenkins_public_ip
}

output "sonarqube_ip" {
  description = "The public IP of the SonarQube instance"
  value       = module.sonarqube.sonarqube_public_ip
}