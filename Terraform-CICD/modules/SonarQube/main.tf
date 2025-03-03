resource "aws_instance" "sonarqube" {
  ami                    = "ami-05b10e08d247fb927"  # Replace with the correct AMI ID
  instance_type          = "t2.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  associate_public_ip_address = true

  tags = {
    Name = "SonarQube-EC2"
  }

  user_data = file("sonarqube.sh")
}

output "sonarqube_public_ip" {
  description = "The public IP of the SonarQube instance"
  value       = aws_instance.sonarqube.public_ip
}
