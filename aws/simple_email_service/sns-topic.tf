resource "aws_sns_topic" "ses_configuration_set_event_destination_sns_topic" {
    name = "${replace(aws_ses_domain_identity.ses_domain.domain, ".", "-")}-configuration-set-event-destination-sns-topic"

    tags = var.tags
}
resource "aws_sns_topic_subscription" "ses_configuration_set_event_destination_sns_topic_subscription" {
    for_each = toset(var.email_subscriptions)

    endpoint = each.value
    protocol = "email"
    topic_arn = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
}
