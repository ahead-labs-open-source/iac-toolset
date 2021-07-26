variable "aws_account_id" {type = string}
variable "aws_region" {type = string}
variable "codecommit_repository" {type = string}
variable "deploy_to" {type = string}
variable "notification_event_type_ids" {
    type = list
    default = [
        "codepipeline-pipeline-action-execution-succeeded",
        "codepipeline-pipeline-action-execution-failed",
        "codepipeline-pipeline-action-execution-canceled",
        "codepipeline-pipeline-action-execution-started",
        "codepipeline-pipeline-stage-execution-started",
        "codepipeline-pipeline-stage-execution-succeeded",
        "codepipeline-pipeline-stage-execution-resumed",
        "codepipeline-pipeline-stage-execution-canceled",
        "codepipeline-pipeline-stage-execution-failed",
        "codepipeline-pipeline-pipeline-execution-failed",
        "codepipeline-pipeline-pipeline-execution-canceled",
        "codepipeline-pipeline-pipeline-execution-started",
        "codepipeline-pipeline-pipeline-execution-resumed",
        "codepipeline-pipeline-pipeline-execution-succeeded",
        "codepipeline-pipeline-pipeline-execution-superseded",
        "codepipeline-pipeline-manual-approval-failed",
        "codepipeline-pipeline-manual-approval-needed",
        "codepipeline-pipeline-manual-approval-succeeded"
    ]
}
variable "notification_sns_topic_arn" {
    type = string
    default = null  
}
variable "sonarqube_starter_lambda_name" {
    type = string
}
variable "stage_build_config" {type = map}
variable "stage_deploy_config_elasticbeanstalk" {type = map}
variable "stage_deploy_config_s3" {type = map}
variable "stage_source_config" {type = map}
variable "pipeline_artifacts_bucket_name" {type = string}
variable "pipeline_name" {type = string}
variable "pipeline_role_name" {type = string}
variable "policy_name" {type = string}
variable "policy_description" {type = string}
variable "tags" {type = map}

output "pipeline_id" {
    value = aws_codepipeline.codepipeline.id
}
output "pipeline_arn" {
    value = aws_codepipeline.codepipeline.arn
}
