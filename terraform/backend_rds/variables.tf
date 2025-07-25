# 🔧 Спільні
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

# 🔷 Для ECS сервісу
variable "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = null
}

variable "cloudmap_namespace_id" {
  description = "Cloud Map namespace ID for service discovery"
  type        = string
  default     = null
}

variable "frontend_sg_id" {
  description = "Security Group ID for the frontend"
  type        = string
  default     = null
}

variable "image_url" {
  description = "URL of the Docker image for backend RDS"
  type        = string
  default     = null
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
  default     = null
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
  default     = null
}

variable "postgres_host" {
  description = "PostgreSQL host"
  type        = string
  default     = null
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = null
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  default     = null
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
  default     = null
}

variable "log_group_dependency" {
  description = "CloudWatch log group to depend on"
  type        = any
  default     = null
}

variable "listener_rule_dependency" {
  description = "Optional dependency on ALB listener rule"
  type        = any
  default     = null
}

variable "db_identifier" {
  description = "RDS DB identifier"
  type        = string
  default     = null
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = null
}

variable "db_username" {
  description = "RDS admin username"
  type        = string
  default     = null
}

variable "db_password" {
  description = "RDS admin password"
  type        = string
  default     = null
}
