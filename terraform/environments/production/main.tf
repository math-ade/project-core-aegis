terraform {
  required_version = ">= 1.5.0"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "math-ade-enterprise"
    workspaces { name = "project-core-aegis-prod" }
  }
}

provider "aws" { region = "us-east-1" }

module "networking" {
  source = "../../modules/vpc"
}

module "compute_cluster" {
  source          = "../../modules/eks"
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
}
