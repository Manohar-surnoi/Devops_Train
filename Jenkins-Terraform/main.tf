# Define the Jenkins-EC2 Instance with Security Group
resource "aws_instance" "Jenkins-EC2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
 
  tags = {
    Name        = var.jenkins_name
    ManagedBy   = var.managed_by
  }

  user_data = file("jenkins.sh")  # Path to your Jenkins setup script (optional)
}


# Define the Security Group to allow SSH, HTTP, TLS, and all outbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "var.security_group_name"
  description = "Allow SSH, HTTP, TLS, and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

   tags = {
    Name      = var.security_group_name
    ManagedBy = var.managed_by
  }

  # Inbound rules: Allow SSH (Port 22), HTTP (Port 80), TLS (Port 443), and All traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow TLS (HTTPS) from anywhere
  }

  # Allow all inbound traffic (port range for all protocols)
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow from anywhere
  }

  # Outbound rules: Allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

# SSH Key Pair Creation
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
}

# TLS Private Key Generation
resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save Private Key Locally
resource "local_file" "private_key" {
  content  = tls_private_key.rsa-4096-example.private_key_pem
  filename = var.key_pair_name
}

# Create Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}



