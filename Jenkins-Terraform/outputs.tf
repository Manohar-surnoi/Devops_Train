output "jenkins_public_ip" {
  value = aws_instance.EC2-server.public_ip
}

# output "sonarqube_public_ip" {
#   value = aws_instance.sonarqube-EC2.public_ip
# }