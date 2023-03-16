variable "instance_type" {
  type    = string
}

variable "enviroment" {}
variable "region" {}
variable "force_destroy" {}

variable "buckets" {
  type = set(string)
}

#variable "outbound_email" {}

#variable "inbound_email" {}
variable "username" {}

variable "elb_name" {}

variable "az" {
  type = list 
}

variable "timeout" {
  type = number
}

