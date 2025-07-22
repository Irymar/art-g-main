resource "aws_service_discovery_private_dns_namespace" "this" {
  name        = "local"
  description = "Service discovery namespace"
  vpc         = var.vpc_id
}
