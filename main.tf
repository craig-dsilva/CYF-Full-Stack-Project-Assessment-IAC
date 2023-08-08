terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.11"
    }
  }

  backend "s3" {
    bucket = "video-recommendations-tf-state"
    key = "./terraform.tfstate"
    region = "eu-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region = "eu-west-2"
}