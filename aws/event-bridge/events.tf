resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
    provider = aws.default

    name = "${var.name}-rule"
    description = var.description
    event_pattern = var.event_pattern
    tags = var.tags
}

resource "aws_cloudwatch_event_target" "eventbridge_target" {
    provider = aws.default

    arn = var.target_arn
    role_arn = aws_iam_role.eventbridge_target_role.arn
    rule = aws_cloudwatch_event_rule.eventbridge_rule.name
}
