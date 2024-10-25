variable "cidr_block" {
  description = "cidr block for the VPC"
  default     = "10.0.0.0/16"
}
 
variable "cidr_block_for_public_subnet1" {
  description = "cidr block for the public subnet1"
  default     = "10.0.1.0/24"
}
variable "cidr_block_for_public_subnet2" {
  description = "cidr block for the second public subnet2"
  default     = "10.0.2.0/24"
}
variable "cidr_block_for_private_subnet1" {
  description = "cidr block for the private subnet"
  default     = "10.0.3.0/24"
}
 
 
variable "cidr_block_for_private_subnet2" {
  description = "cidr block for another private subnet"
  default     = "10.0.4.0/24"
}

variable "instance_tenancy" {
  description = "The supported tenancy options for instances launched into the VPC"
  default     = "default"
}
 
variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  default     = true
}
variable "availability_zones" {
  default = ["ap-northeast-2a", "ap-northeast-2b"]  # Specify actual zones
}
 
