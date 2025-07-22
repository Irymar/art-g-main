output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_execution_role.arn
}

output "ecs_admin_role_arn" {
  value = aws_iam_role.ecs_admin_role.arn
}
