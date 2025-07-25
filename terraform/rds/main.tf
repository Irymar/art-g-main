resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = var.db_identifier
  engine                  = "postgres"
  engine_version          = "15.13"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20

  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name

  db_subnet_group_name    = aws_db_subnet_group.this.name
vpc_security_group_ids    = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false
}
