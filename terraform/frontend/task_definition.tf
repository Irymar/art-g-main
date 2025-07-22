resource "aws_ecs_task_definition" "frontend" {
  family                   = "frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = var.image_url
      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ]
      essential = true
      environment = [
        { name = "BACKEND_RDS_URL", value = var.backend_rds_url },
        { name = "BACKEND_REDIS_URL", value = var.backend_redis_url }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/frontend"
          awslogs-region        = "eu-north-1"
          awslogs-stream-prefix = "frontend"
        }
      }
    }
  ])

  depends_on = [var.log_group_dependency]
}
