variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "frontend_image_url" {
  description = "Docker image URI for frontend"
  type        = string
}

variable "backend_rds_image_url" {
  description = "Docker image URI for backend RDS"
  type        = string
}

variable "backend_redis_image_url" {
  description = "Docker image URI for backend Redis"
  type        = string
}
