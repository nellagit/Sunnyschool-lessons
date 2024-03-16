terraform {
  backend "s3" {
    bucket         = "nellaterraform-state-bucket"
    key            = "tfstate/state"
    region         = "us-east-1"
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
  region = "us-east-1"
}
