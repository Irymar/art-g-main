resource "aws_security_group" "frontend_sg" {
  name        = "frontend-sg"
  description = "Security Group for frontend"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from ALB"
    from_port       = 8002  # або 3000, якщо потрібно
    to_port         = 8002
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend-sg"
  }
}
