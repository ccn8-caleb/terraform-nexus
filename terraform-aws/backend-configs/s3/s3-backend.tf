terraform {
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }
  }
}

provider "aws" {
  region = local.region
}