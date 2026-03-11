terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source               = "../../modules/vpc"
  name                 = "dev"
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source              = "../../modules/eks"
  name                = "dev"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids
  cluster_version     = "1.35"
  cluster_name        = "dev"
}

