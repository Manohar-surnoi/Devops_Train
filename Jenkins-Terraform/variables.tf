# variables.tf

variable "ami" {
  description = "AMI ID to be used for EC2 instance"
  type        = string
  default     = "ami-0b03299ddb99998e9"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"  # Make sure this is a valid instance type for your region
}

variable "key_pair_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "instance_name" {
  description = "The Name tag for the Jenkins EC2 instance"
  default     = "sonarqube-EC2"
}

variable "managed_by" {
  description = "Managed by information"
  type        = string
  default     = "Manohar"
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "allow_tls"
}