# Data source to fetch available availability zones
data "aws_availability_zones" "available" {
  state = "available" # Fetch only the available zones
}
resource "aws_vpc" "demo_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "demo_vpc"
  }
}
resource "aws_subnet" "demo_public_subnet1" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.cidr_block_for_public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0] # Use the first available zone
 
  tags = {
    Name = "demo_public_subnet1"
  }
}
 
resource "aws_subnet" "demo_public_subnet2" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = var.cidr_block_for_public_subnet2
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1] # Use the second available zone
 
  tags = {
    Name = "demo_public_subnet2"
  }
}
 
resource "aws_subnet" "demo_private_subnet1" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.cidr_block_for_private_subnet1
  availability_zone = data.aws_availability_zones.available.names[0] # Use the first available zone
 
  tags = {
    Name = "demo_private_subnet1"
  }
}
 
resource "aws_subnet" "demo_private_subnet2" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.cidr_block_for_private_subnet2
  availability_zone = data.aws_availability_zones.available.names[1] # Use the second available zone
 
  tags = {
    Name = "demo_private_subnet2"
  }
}