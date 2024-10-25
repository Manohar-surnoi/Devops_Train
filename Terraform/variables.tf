variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type for resources"
}

variable "access_key" {
  type        = string
  description = "accesskey for AWS"
}

variable "secret_key" {
  type        = string
  description = "secretkey for AWS"
}

variable "cidr_block" {
  description = "cidr block for the VPC"
  default     = "10.0.0.0/16"
}