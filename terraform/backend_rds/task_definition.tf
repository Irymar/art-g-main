resource "aws_ecs_task_definition" "backend_rds" {
  family                   = "backend-rds-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "backend-rds"
      image     = var.image_url
      portMappings = [
        {
          containerPort = 8000
          protocol      = "tcp"
        }
      ]
      essential = true
      environment = [
        { name = "POSTGRES_HOST", value = var.postgres_host },
        { name = "POSTGRES_PORT", value = "5432" },
        { name = "POSTGRES_USER", value = var.postgres_user },
        { name = "POSTGRES_PASSWORD", value = var.postgres_password },
        { name = "POSTGRES_DB", value = var.postgres_db }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/backend-rds"
          awslogs-region        = "eu-north-1"
          awslogs-stream-prefix = "backend-rds"
        }
      }
    }
  ])

  depends_on = [var.log_group_dependency]
}