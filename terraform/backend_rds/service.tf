resource "aws_service_discovery_service" "this" {
  name = "backend-rds"

  dns_config {
    namespace_id = var.cloudmap_namespace_id

    dns_records {
      type = "A"
      ttl  = 10
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}


resource "aws_ecs_service" "backend_rds" {
  name            = "backend-rds-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.backend_rds.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [aws_security_group.backend_rds_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.this.arn
  }

  depends_on = [var.listener_rule_dependency]
}
