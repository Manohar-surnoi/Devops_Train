variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"  # Change as needed
}

variable "key_name" {
  description = "The SSH key name for EC2 instances"
}

variable "vpc_security_group_ids" {
  description = "Security group ID for the instances"
}