/* CodeBuild projects for each software product */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default, aws.global ]
    }
  }
}

// Get CodeCommit repository
data "aws_codecommit_repository" "codecommit_repository" {
    provider = aws.default
    repository_name = var.codecommit_repository
}

variable "artifacts_bucket_name" {type = string}
variable "buildspec_file" {
    type = string
    default = ".devops/buildspec.yml"
}
variable "cache_bucket_name" {type = string}
variable "codebuild_project_name" {type = string}
variable "codebuild_project_description" {type = string}
variable "codebuild_source_version" {
    type = string
    default = "refs/heads/main"
}
variable "codecommit_repository" {type = string}
variable "compute_specs" {type = map}
variable "compute_os" {type = string}
variable "environment_variables_plaintext" {type = map}
variable "git_repository_https_url" {type = string}
variable "log_group_name" {type = string}
variable "policy_description" {type = string}
variable "policy_name" {type = string}
variable "security_group_ids" {type = list}
variable "service_role_name" {type = string}
variable "subnet_ids" {type = set(string)}
variable "tags" {type = map}
variable "timeouts" {
    type = map
    default = {
        build = "15"
        queue = "480"
    }
}
variable "vpc_id" {type = string}

// Builds for each software product
resource "aws_codebuild_project" "codebuild_project" {
    provider = aws.default

    name = var.codebuild_project_name
    description = var.codebuild_project_description
    service_role = aws_iam_role.codebuild_pipeline_role.arn
    source_version = var.codebuild_source_version
    build_timeout = var.timeouts.build
    queued_timeout = var.timeouts.queue
    badge_enabled = true

    environment {
        type                        = var.compute_specs.container
        compute_type                = var.compute_specs.size
        image                       = var.compute_os
        image_pull_credentials_type = "CODEBUILD"

        dynamic "environment_variable" {
            for_each = var.environment_variables_plaintext
            content {
                name = upper(environment_variable.key)
                value = environment_variable.value
            }
        }
    }

    source {
        type = "CODECOMMIT"
        location = var.git_repository_https_url
        buildspec = var.buildspec_file

        git_submodules_config {
            fetch_submodules = false
        }
    }

    artifacts {
        type = "S3"
        location = module.bucket_codebuild_artifacts.bucket
        override_artifact_name = true
        packaging = "ZIP"
    }

    cache {
        type     = "S3"
        location = module.bucket_codebuild_cache.bucket
    }

    logs_config {
        cloudwatch_logs {
            group_name  = module.cloudwatch_builds_log_group.name
            stream_name = "build"
        }
    }

    vpc_config {
        vpc_id = var.vpc_id
        subnets = var.subnet_ids
        security_group_ids = var.security_group_ids
    }

    tags = var.tags
}
