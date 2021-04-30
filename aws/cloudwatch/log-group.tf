resource "aws_cloudwatch_log_group" "cloudwatch_builds_log_group" {
    provider = aws.default

    name = var.log_group_name
    retention_in_days = 7
    tags = var.log_group_tags
}
