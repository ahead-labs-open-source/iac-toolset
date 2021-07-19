resource "aws_codestarnotifications_notification_rule" "codepipeline_failure_notification" {
    count = var.notification_sns_topic_arn == null ? 0 : 1

    name = "${aws_codepipeline.codepipeline.id}-failure-notification-rule"
    detail_type = "FULL"
    event_type_ids = var.notification_event_type_ids
    resource = aws_codepipeline.codepipeline.arn
    target {
        address = var.notification_sns_topic_arn
    }

    tags = var.tags
}
