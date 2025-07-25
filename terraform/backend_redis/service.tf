resource "aws_ecs_service" "backend_redis" {
  name            = "backend-redis-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.backend_redis.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.backend_redis_sg_id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.this.arn
  }

  depends_on = [var.listener_rule_dependency]
}
