terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.70.0"
    }
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}