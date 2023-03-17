variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "env_prefix" {
  description = "The prefix for environment-specific resources"
  type = string
  default = "aidana"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type = string
  default = "10.0.0.0/24"
}

#variable "public_key_location" {
  #description = "Location of the public key file"
  #type        = string
#}


variable availability_zone {}
