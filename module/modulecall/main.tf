provider "aws" {
    region = "us-east-1"
}

module "vpc" {
  source = "../../module/vpc"
}

module "vpc-dev" {
  source = "../../module/vpc"
}

module "vpc-prod" {
  source = "../../module/vpc"
}

module "vpc-test" {
  source = "../../module/vpc"
}



