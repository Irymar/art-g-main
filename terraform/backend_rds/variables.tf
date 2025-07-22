variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "frontend_sg_id" {
  description = "Security Group ID for the frontend"
  type        = string
}

variable "image_url" {
  description = "URL of the Docker image for backend RDS (ECR)"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "postgres_host" {
  description = "PostgreSQL host"
  type        = string
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
}

variable "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "backend_rds_sg_id" {
  description = "Security Group ID for backend RDS"
  type        = string
}

variable "listener_rule_dependency" {
  description = "Optional dependency on ALB listener rule"
  type        = any
  default     = null
}

variable "log_group_dependency" {
  description = "CloudWatch log group to depend on"
  type        = any
}