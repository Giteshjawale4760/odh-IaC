terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

# locals
locals {
  region           = "us-east-1"
  region_alias     = "UsE1"
  env              = "dev"

  azs = {
    "Az1" = "us-east-1a"
    "Az2" = "us-east-1b"
    "Az3" = "us-east-1c"
  }

  default_tags = {
    "Environment"  = "dev"
    "Region"       = "use1"
    "Purpose"      = "Infra for ODH dev environment"
    "CreatedUsing" = "Terraform"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = local.region

  default_tags {
    tags = local.default_tags
  }
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnets = {
    
  }
  private_subnets = {
    
  }
}