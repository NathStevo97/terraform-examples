terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "3.3.0"
    }
  }
}

provider "aws" {
  profile = "Nathan-Dev"
  region  = "eu-west-2"
}

provider "docker" {

}