terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region                   = "eu-west-2"
  shared_credentials_files = ["credentials"]
  profile                  = "testing"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09885f3ec1667cbfc"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}