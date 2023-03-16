provider "aws" {
  region = "us-east-1"
  alias = "east1"
}

provider "aws" {
  alias = "east2"
  region = "us-east-2"
}












