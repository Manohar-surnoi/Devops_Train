provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "jenkins" {
  ami           = "ami-05b10e08d247fb927" 
  instance_type = "t2.medium" 

  key_name      = "kubernetes" 
  vpc_security_group_ids = ["sg-09e92de80fdeb08a3"] 

  tags = {
    Name = "Jenkins-EC2"
  }
  
  user_data = file("cicd-config.sh") 

}