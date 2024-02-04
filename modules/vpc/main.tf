# This main.tf file contains all VPC components
# This is VPC module which can be use to Create VPC

# VPC
# https://registry.terraform.io/providers/hashicorp/aws/5.32.1/docs/resources/vpc.html
resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr_block
  tags = var.vpctags
}

# Subnets
# https://registry.terraform.io/providers/hashicorp/aws/5.32.1/docs/resources/subnetS
resource "aws_subnet" "subnets" {
  for_each          = merge(var.public_subnets, var.private_subnets)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
  tags = merge(
    tomap({ "Name" = each.value.name, "SubnetTier" = each.value.tier })
  )
}

