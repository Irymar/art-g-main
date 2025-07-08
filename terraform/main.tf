terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1" # або інша, яка тобі підходить
    }
  }
}

provider "aws" {
  region = "eu-north-1"  # або той, який ти використовуєш (наприклад, Стокгольм)
}

module "vpc" {
  source = "./vpc"  # шлях до модуля

  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["eu-north-1a", "eu-north-1b"]
}
