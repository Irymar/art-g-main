variable "cluster_name" {
  type    = string
  default = "art-gallery-cluster"
}

variable "vpc_id" {
  description = "VPC ID for Cloud Map"
  type        = string
}
