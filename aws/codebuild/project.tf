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

    dynamic "vpc_config" {
        for_each = var.vpc
        content{
            vpc_id = vpc_config.value["vpc_id"]
            subnets = vpc_config.value["subnets"]
            security_group_ids = vpc_config.value["security_group_ids"]
        }
    }

    tags = var.tags
}
