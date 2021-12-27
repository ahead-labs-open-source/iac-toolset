resource "aws_sfn_state_machine" "state_machine" {
    provider = aws.default

    name = "${var.name}-state-machine"
    definition = var.definition
    logging_configuration {
        include_execution_data = var.logging.include_execution_data
        level = var.logging.level
        log_destination = "${aws_cloudwatch_log_group.state_machine_log_group.arn}:*"
    }
    role_arn = aws_iam_role.state_machine_role.arn
    tags = var.tags
    type = var.type
}
