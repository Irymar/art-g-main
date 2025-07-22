resource "aws_security_group" "backend_redis_sg" {
  name        = "backend-redis-sg"
  description = "Security Group for backend Redis"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow access from frontend"
    from_port       = 8001
    to_port         = 8001
    protocol        = "tcp"
    security_groups = [var.frontend_sg_id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-redis-sg"
  }
}
