output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "cloudmap_namespace_id" {
  description = "ID of the Cloud Map private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.this.id
}

