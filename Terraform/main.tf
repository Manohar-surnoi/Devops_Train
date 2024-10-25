provider "aws" {
  region     = "ap-northeast-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "my_VPC" {
  source        = "./modules/compute"
  instance_type = "t2.micro"
}

resource "aws_instance" "demo_server" {
  ami           = "ami-06f73fc34ddfd65c2"
  instance_type = var.instance_type

  tags = { # Move tags inside the resource block
    Name = "demo_server"
  }
}


