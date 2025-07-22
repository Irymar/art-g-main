output "alb_dns_name" {
  description = "DNS name of the ALB to access the frontend"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN (Amazon Resource Name) of the ALB"
  value       = aws_lb.this.arn
}

output "alb_listener_arn" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.http.arn
}

output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "frontend_target_group_arn" {
  description = "ARN of the target group for the frontend"
  value       = aws_lb_target_group.frontend.arn
}

output "listener_rule" {
  description = "ID of the ALB listener rule for the frontend"
  value       = aws_lb_listener_rule.frontend_rule.id
}
