terraform {
  backend "s3" {
    bucket         = "nellaterraform-state-bucket2"
    key            = "tfstate/state"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "nella-lock-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}
