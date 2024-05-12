terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
    region = var.region_aws # Configuration options
    access_key = var.access_key_aws
    secret_key = var.secret_key_aws
}