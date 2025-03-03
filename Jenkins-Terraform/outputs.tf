output "jenkins_public_ip" {
  value = aws_instance.Jenkins-EC2.public_ip
}