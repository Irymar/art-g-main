variable "public_subnet_ids" {
  description = "IDs of public subnets for ALB placement"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC for creating the Security Group"
  type        = string
}
