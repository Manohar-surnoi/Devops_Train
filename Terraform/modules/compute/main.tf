resource "aws_instance" "second_demo_server" {
  ami           = "ami-06f73fc34ddfd65c2"
  instance_type = var.instance_type

  tags = { # Move tags inside the resource block
    Name = "second_demo_server"
  }
}