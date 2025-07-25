variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_identifier" {
  description = "RDS DB identifier"
  type        = string
}

variable "db_name" {
  description = "RDS database name"
  type        = string
}

variable "db_username" {
  description = "RDS admin username"
  type        = string
}

variable "db_password" {
  description = "RDS admin password"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for RDS SG"
  type        = string
}