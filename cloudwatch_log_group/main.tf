terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default ]
    }
  }
}

variable "log_group_name" {
    type = string
}
variable "log_group_retention_days" {
    type = number
    default = 7
}
variable "log_group_tags" {
    type = map
    default = {}
}

resource "aws_cloudwatch_log_group" "cloudwatch_builds_log_group" {
    provider = aws.default

    name = "${replace(lookup(var.product, "id"),".","-")}-${var.environment}-build-log-group"
    retention_in_days = 7
    tags = var.log_group_tags
}

output "arn" {
    value = aws_cloudwatch_log_group.cloudwatch_builds_log_group.arn
}
output "name" {
    value = aws_cloudwatch_log_group.cloudwatch_builds_log_group.name
}
