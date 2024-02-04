# Variables file 

# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpctags" {
  description = "Common tags to be applied to resources"
  type        = map(string)
  default = {
    "name" = "ODH-VPC"
  }
}

# Subnet Variables
variable "public_subnets" {
  description = "Map of public subnet configurations"
  type        = map(object({
    cidr_block = string
    az         = string
    name       = string
    tier       = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnet configurations"
  type        = map(object({
    cidr_block = string
    az         = string
    name       = string
    tier       = string
  }))
}


