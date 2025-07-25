resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow access to RDS from ECS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # або конкретно під ECS, якщо хочеш
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
