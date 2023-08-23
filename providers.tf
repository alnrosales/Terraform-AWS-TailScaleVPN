terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key

}

