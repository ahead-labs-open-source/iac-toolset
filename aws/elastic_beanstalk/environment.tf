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
