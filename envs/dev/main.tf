terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source   = "../../modules/vpc"
  name     = "dev"
  vpc_cidr = var.vpc_cidr
}
