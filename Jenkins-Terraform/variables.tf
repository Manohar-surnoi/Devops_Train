# variables.tf

variable "ami" {
  type        = string
  default     = "ami-0b03299ddb99998e9"
}

variable "instance_type" {
  type        = string
  default     = "t2.medium"  # Make sure this is a valid instance type for your region
}

variable "key_pair_name" {
  type        = string
}

variable "instance_name" {
  default     = "Jenkins-EC2"
}

variable "managed_by" {
  type        = string
  default     = "Manohar"
}

variable "security_group_name" {
  type        = string
  default     = "allow_tls"
}