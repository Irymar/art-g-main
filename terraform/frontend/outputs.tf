output "frontend_sg_id" {
  description = "Security Group ID for frontend"
  value       = aws_security_group.frontend_sg.id
}
