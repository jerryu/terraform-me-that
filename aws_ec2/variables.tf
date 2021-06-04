variable "cidr_vpc" {
  description = "CIDR block for AWS VPC"
  default     = "10.1.1.0/24"
}

variable "cidr_subnet" {
  description = "CIDR block for AWS subnet"
  default     = "10.1.1.0/26"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "terraformed"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "instance type to deploy your instance as"
  default     = "t3.nano"
}

variable "ec2_market_type" {
  description = "market type to deploy your instance from: on-demand or spot"
  default     = "spot"
}

variable "user_data_raw" {
  description = "user_data script file"
  default     = "user_data.raw"
}

variable "sshkey_name" {
  default = "id_terra"
}
