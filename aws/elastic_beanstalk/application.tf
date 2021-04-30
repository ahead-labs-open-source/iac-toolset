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
