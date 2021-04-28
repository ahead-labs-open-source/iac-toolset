/* Elastic Beanstalk applications and environments */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default, aws.global ]
    }
  }
}

variable "application_name" {type = string}
variable "application_description" {type = string}
variable "application_domain" {type = string}
variable "application_environment_domain" {type = string}
variable "elastic_beanstalk_hosted_zone" {}
variable "environment_tier" {
    type = string
    default = "WebServer"
}
variable "root_dns_zone" {}
variable "service_role_name" {type = string}
variable "settings" {type = map}
variable "stack_name" {type = string}
variable "tags" {type = map}

resource "aws_elastic_beanstalk_application" "eb_application" {
    provider = aws.default

    name = var.application_name
    tags = var.tags

    appversion_lifecycle {
        service_role = aws_iam_role.eb_application_service_role.arn
        max_count = 3
        delete_source_from_s3 = true
    }
}

resource "aws_elastic_beanstalk_environment" "eb_application_environment" {
    provider = aws.default

    application = "${aws_elastic_beanstalk_application.eb_application.name}"
    description = "${title(terraform.workspace)} environment for the ${aws_elastic_beanstalk_application.eb_application.name} application."
    name = "${aws_elastic_beanstalk_application.eb_application.name}-${terraform.workspace}"
    solution_stack_name = var.stack_name
    tags = var.tags
    tier = var.environment_tier

    dynamic "setting" {
        for_each = var.settings
        content {
            namespace = setting.value["namespace"]
            name = setting.value["name"]
            value = setting.value["value"]
        }
    }
}

/*
NOTE:
A list of valid values for SolutionStackName could be obtained using AWS CLI using the following command:
aws elasticbeanstalk list-available-solution-stacks
*/
