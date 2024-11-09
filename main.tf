terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}


module "my_ec2_instance" {
  source        = "./modules/ec2-instance"
  ami_id        = var.ami_id
  instance_type = var.instance_type
}