resource "aws_instance" "jenkins" {
  ami                    = "ami-05b10e08d247fb927"  # Replace with the correct AMI ID
  instance_type          = "t2.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-EC2"
  }

  user_data = file("jenkins.sh")
}

output "jenkins_public_ip" {
  description = "The public IP of the Jenkins instance"
  value       = aws_instance.jenkins.public_ip
}
