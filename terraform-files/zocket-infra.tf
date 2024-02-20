terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  backend "s3" {
    bucket         = "zocket-infra"
    key            = "state/terraform.state"
    region         = "us-east-1"
    dynamodb_table = "zocket"
  }
}


provider "aws" {

  region = "us-east-1"

}
---

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}

---

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = var.keyname
  create_private_key = true
}

---

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.0.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    zocket_node_1 = {
      desired_capacity = 1
      instance_type    = var.instance_type
      volume_size      = 8
      key_name         = module.key_pair.key_pair_name
      subnets          = module.vpc.private_subnets
      tags = {
        "Name" = var.NG-Name
      }
    }
  }
}

