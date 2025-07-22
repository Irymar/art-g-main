output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}
output "ecs_execution_role_arn" {
  value = module.iam.ecs_execution_role_arn
}

output "ecs_admin_role_arn" {
  value = module.iam.ecs_admin_role_arn
}
