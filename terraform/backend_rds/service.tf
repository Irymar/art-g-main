resource "aws_ecs_service" "backend_rds" {
  name            = "backend-rds-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.backend_rds.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.backend_rds_sg_id]
    assign_public_ip = false
  }

  depends_on = [var.listener_rule_dependency]
}


