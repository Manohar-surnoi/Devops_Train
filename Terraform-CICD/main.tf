resource "aws_key_pair" "key_pair" {
  key_name   = "kubernetes"
  public_key = file("~/.ssh/id_rsa.pub")  # Ensure this public key exists on your machine
}

module "jenkins" {
  source        = "./modules/jenkins"
  key_name      = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = ["sg-09e92de80fdeb08a3"]  # Replace with your security group ID
}

module "sonarqube" {
  source        = "./modules/sonarqube"
  key_name      = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = ["sg-09e92de80fdeb08a3"]  # Replace with your security group ID
}

output "jenkins_ip" {
  description = "The public IP of the Jenkins instance"
  value       = module.jenkins.jenkins_public_ip
}

output "sonarqube_ip" {
  description = "The public IP of the SonarQube instance"
  value       = module.sonarqube.sonarqube_public_ip
}
