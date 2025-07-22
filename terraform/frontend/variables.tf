variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_sg_id" {
  description = "Security Group ID for ALB"
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

variable "frontend_sg_id" {
  description = "Security Group ID for frontend"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

variable "listener_rule_dependency" {
  description = "Optional dependency on ALB listener rule"
  type        = any
}

variable "image_url" {
  description = "URL of the Docker image for frontend (ECR)"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the task role for the container"
  type        = string
}

variable "backend_rds_url" {
  description = "URL to the backend RDS service"
  type        = string
}

variable "backend_redis_url" {
  description = "URL to the backend Redis service"
  type        = string
}

variable "log_group_dependency" {
  description = "CloudWatch log group to depend on"
  type        = any
}
