terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.18.0"
    }
  }
}

provider "aws" {
  profile = "Nathan-Dev"
  region  = "eu-west-2"
}

provider "postgresql" {
  scheme          = "awspostgres"
  host            = aws_db_instance.ckan.address
  username        = aws_db_instance.ckan.username
  port            = 5432
  password        = var.db_password
  superuser       = false
  connect_timeout = 720
}