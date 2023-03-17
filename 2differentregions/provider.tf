provider "aws" {
  region = "us-east-1"
  alias = "east"
}

provider "aws" {
  alias = "west"
  region = "eu-west-1"
}

