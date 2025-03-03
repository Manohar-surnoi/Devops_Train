# variables.tf

variable "ami" {
  description = "AMI ID to be used for EC2 instance"
  type        = string
  default     = "ami-05b10e08d247fb927"
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

variable "jenkins_name" {
  description = "The Name tag for the Jenkins EC2 instance"
  default     = "Jenkins-EC2"
}

variable "managed_by" {
  description = "The Managed by tag for the EC2 instance"
  default     = "Manohar"
}

variable "security_group_name" {
  description = "The name tag for the security group"
  type        = string
  default     = "allow_tls"
}