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
  shared_credentials_files = ["$HOME/.aws/credentials"]
  

}

