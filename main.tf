terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  shared_config_files      = var.shared_config_files
  shared_credentials_files = var.shared_credentials_files

  default_tags {
    tags = {
      "Owner" = "Eduardo"
    }
  }
}

#################VPC#################

module "vpc" {
  source          = "./modules/VPC"
  vpc_name        = "vpc-${var.cluster_name}"
  vpc_cidr        = "172.16.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["172.16.1.0/24", "172.16.2.0/24"]
  private_subnets = ["172.16.3.0/24", "172.16.4.0/24"]
  cluster_name    = var.cluster_name
}

#################RDS#################

module "rds" {
  source = "./modules/RDS"  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  rds_allocated_storage = 20
  rds_storage_type = "gp2"
  rds_instance_class = "db.t2.micro"
  rds_username = var.rds_username
  rds_password = var.rds_password
  rds_port = 3306
  rds_identifier = lower("rds-${var.cluster_name}")
  rds_parameter_group_name = "default.mysql5.7"
}

#################ECS#################

module "ecs" {
  source       = "./modules/ECS"
  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  public_subnets = module.vpc.public_subnets
  image_uri = var.image_uri
  target_group_arn = module.alb.target_group_arn
  rds_endpoint = module.rds.rds_endpoint
  rds_username = var.rds_username
  rds_password = var.rds_password
  rds_db_name = "rds-${var.cluster_name}"
}

#################ALB#################

module "alb" {
  source               = "./modules/alb"
  vpc_id               = module.vpc.vpc_id
  subnets              = module.vpc.public_subnets
  alb_name             = "alb-${var.cluster_name}"
  target_group_port    = 5000
  target_group_protocol = "HTTP"
  security_group_ids   = [module.ecs.sg_id]
}

#################WAF#################

module "waf" {
  source = "./modules/WAF"
  waf_name = "waf-${var.cluster_name}"
  waf_scope = "REGIONAL"
  alb_arn = module.alb.alb_arn

  depends_on = [ module.alb ]
}