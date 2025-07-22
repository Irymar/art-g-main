variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "frontend_sg_id" {
  description = "Security Group ID for the frontend"
  type        = string
}

variable "image_url" {
  description = "URL of the Docker image for backend Redis (ECR)"
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

variable "redis_host" {
  description = "Redis hostname"
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

variable "backend_redis_sg_id" {
  description = "Security Group ID for backend Redis"
  type        = string
}

variable "listener_rule_dependency" {
  description = "Optional dependency on ALB listener rule"
  type        = any
  default     = null
}

variable "cloudmap_namespace_id" {
  description = "Cloud Map namespace ID for service discovery"
  type        = string
}

variable "log_group_dependency" {
  description = "CloudWatch log group to depend on"
  type        = any
}
