terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

# ---------------- VPC ----------------
module "vpc" {
  source = "./vpc"

  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["eu-north-1a", "eu-north-1b"]
}

# ---------------- ECS ----------------
module "ecs" {
  source       = "./ecs"
  cluster_name = "art-gallery-cluster"
  vpc_id       = module.vpc.vpc_id
}

# ---------------- IAM ----------------
module "iam" {
  source = "./iam"
}

# ---------------- ALB ----------------
module "alb" {
  source            = "./alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.alb.alb_sg_id
}

# ---------------- CloudWatch Logs ----------------
resource "aws_cloudwatch_log_group" "frontend" {
  name              = "/ecs/frontend"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "backend_rds" {
  name              = "/ecs/backend-rds"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "backend_redis" {
  name              = "/ecs/backend-redis"
  retention_in_days = 7
}

# ---------------- RDS DB ----------------
module "rds" {
  source = "./rds"

  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id

  db_identifier = "artgallery-postgres"
  db_name       = "artdb"
  db_username   = "art_user"
  db_password   = var.db_password
}

# ---------------- Frontend Service ----------------
module "frontend" {
  source              = "./frontend"
  vpc_id              = module.vpc.vpc_id
  alb_sg_id           = module.alb.alb_sg_id
  ecs_cluster_id      = module.ecs.cluster_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  frontend_sg_id      = module.frontend.frontend_sg_id
  log_group_dependency = aws_cloudwatch_log_group.frontend

  image_url          = var.frontend_image_url
  backend_rds_url    = "http://backend-rds.local:8000"
  backend_redis_url  = "http://backend-redis.local:8001"

  execution_role_arn = module.iam.ecs_execution_role_arn
  task_role_arn      = module.iam.ecs_admin_role_arn

  target_group_arn         = module.alb.frontend_target_group_arn
  listener_rule_dependency = module.alb.listener_rule
}

# ---------------- Backend RDS Service ----------------
module "backend_rds" {
  source                = "./backend_rds"
  ecs_cluster_id        = module.ecs.cluster_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  vpc_id                = module.vpc.vpc_id
  cloudmap_namespace_id = module.ecs.cloudmap_namespace_id
  frontend_sg_id        = module.frontend.frontend_sg_id
  log_group_dependency  = aws_cloudwatch_log_group.backend_rds

  image_url          = var.backend_rds_image_url

  postgres_host      = module.rds.rds_endpoint
  postgres_user      = "your_user"
  postgres_password  = "your_password"
  postgres_db        = "your_db"

  execution_role_arn = module.iam.ecs_execution_role_arn
  task_role_arn      = module.iam.ecs_admin_role_arn
}

# ---------------- Backend Redis Service ----------------
module "backend_redis" {
  source                = "./backend_redis"
  ecs_cluster_id        = module.ecs.cluster_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  backend_redis_sg_id   = module.backend_redis.backend_redis_sg_id
  vpc_id                = module.vpc.vpc_id
  frontend_sg_id        = module.frontend.frontend_sg_id
  cloudmap_namespace_id = module.ecs.cloudmap_namespace_id
  log_group_dependency  = aws_cloudwatch_log_group.backend_redis

  image_url          = var.backend_redis_image_url
  redis_host         = "redis.local"

  execution_role_arn = module.iam.ecs_execution_role_arn
  task_role_arn      = module.iam.ecs_admin_role_arn
}

# ---------------- Outputs ----------------
output "alb_sg_id" {
  value = module.alb.alb_sg_id
}

output "alb_dns_name" {
  description = "Public DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "ecs_cluster_id" {
  value = module.ecs.cluster_id
}
