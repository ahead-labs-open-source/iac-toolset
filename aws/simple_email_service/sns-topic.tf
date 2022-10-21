resource "aws_sns_topic" "ses_configuration_set_event_destination_sns_topic" {
  name = "${replace(aws_ses_domain_identity.ses_domain.domain, ".", "-")}-configuration-set-event-destination-sns-topic"

  tags = var.tags
}
resource "aws_sns_topic_subscription" "ses_configuration_set_event_destination_sns_topic_subscription" {
  for_each = toset(var.email_subscriptions)

  endpoint  = each.value
  protocol  = "email"
  topic_arn = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
}

resource "aws_ses_identity_notification_topic" "ses_feedback_notification_bounce" {
  topic_arn                = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
  notification_type        = "Bounce"
  identity                 = aws_ses_domain_identity.ses_domain.domain
  include_original_headers = true
}
resource "aws_ses_identity_notification_topic" "ses_feedback_notification_complaint" {
  topic_arn                = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
  notification_type        = "Complaint"
  identity                 = aws_ses_domain_identity.ses_domain.domain
  include_original_headers = true
}
resource "aws_ses_identity_notification_topic" "ses_feedback_notification_delivery" {
  topic_arn                = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
  notification_type        = "Delivery"
  identity                 = aws_ses_domain_identity.ses_domain.domain
  include_original_headers = true
}
