resource "aws_ecs_task_definition" "backend_redis" {
  family                   = "backend-redis-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "backend-redis"
      image     = var.image_url
      portMappings = [
        {
          containerPort = 8001
          protocol      = "tcp"
        }
      ]
      essential = true
      environment = [
        { name = "REDIS_HOST", value = var.redis_host },
        { name = "REDIS_PORT", value = "6379" }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/backend-redis"
          awslogs-region        = "eu-north-1"
          awslogs-stream-prefix = "backend-redis"
        }
      }
    }
  ])

  depends_on = [var.log_group_dependency]
}
