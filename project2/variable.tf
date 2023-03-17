variable "env_prefix" {
  description = "Owner name"
  type = string
  default = "aidana"
}

variable "cidr_block_public" {
  description = "The CIDR block for the public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "cidr_block_private" {
  description = "The CIDR block for the public subnet"
  type = string
  default = "10.0.2.0/24"
}


variable "subnet_cidr_private" {
  description = "The CIDR block for the private subnet"
  type = string
  default = "10.10.2.0/24"
}

variable "instance_type" {
  type    = string
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "availability_zone_public" {
  type = string
  default = "us-east-1a"
}

variable "availability_zone_private" {
  type = string
  default = "us-east-1b"
}


