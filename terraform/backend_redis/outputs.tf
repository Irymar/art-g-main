output "backend_redis_sg_id" {
  description = "Security Group ID for backend Redis"
  value       = aws_security_group.backend_redis_sg.id
}

output "backend_redis_service_name" {
  value = aws_ecs_service.backend_redis.name
}

