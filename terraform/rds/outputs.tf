
output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}
output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
