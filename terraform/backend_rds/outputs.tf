output "backend_rds_sg_id" {
  description = "Security Group ID for backend RDS"
  value       = aws_security_group.backend_rds_sg.id
}

output "backend_rds_service_name" {
  value = aws_ecs_service.backend_rds.name
}
