# Configuration set must be assigned to a domain identity manually because this functionlity has not been yet added to Terraform

resource "aws_ses_configuration_set" "ses_configuration_set" {
    name = "${replace(aws_ses_domain_identity.ses_domain.domain, ".", "-")}-configuration-set"
    
    reputation_metrics_enabled = var.email_reputation_metrics_enabled
    delivery_options {
        tls_policy = var.configuration_set_tls
    }
}
resource "aws_ses_event_destination" "ses_configuration_set_event_destination_sns" {
    name = "${replace(aws_ses_domain_identity.ses_domain.domain, ".", "-")}-configuration-set-event-destination-sns"
    configuration_set_name = aws_ses_configuration_set.ses_configuration_set.id
    enabled = var.events_enabled
    matching_types = var.event_types

    sns_destination {
        topic_arn = aws_sns_topic.ses_configuration_set_event_destination_sns_topic.arn
    }
}
