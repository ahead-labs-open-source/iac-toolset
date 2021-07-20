resource "aws_sns_topic" "sns_codepipeline_notifications" {
    name = var.name
    display_name = var.display_name
    http_success_feedback_role_arn = aws_iam_role.sns_codepileline_notification_success_role.arn
    http_failure_feedback_role_arn = aws_iam_role.sns_codepileline_notification_failure_role.arn
    http_success_feedback_sample_rate = var.http_success_feedback_sample_rate
    tags = var.tags
}

resource "aws_sns_topic_policy" "sns_codepipeline_notifications_topic_policy" {
    arn = aws_sns_topic.sns_codepipeline_notifications.arn
    policy = data.aws_iam_policy_document.sns_codepipeline_notifications_policy.json
}

data "aws_iam_policy_document" "sns_codepipeline_notifications_policy" {
    policy_id = "__sns_codepipeline_notifications_policy_id"

    statement {
        sid = "__default_statement_id"
        effect = "Allow"

        principals {
            type = "AWS"
            identifiers = ["*"]
        }

        actions = [
            "SNS:AddPermission",
            "SNS:DeleteTopic",
            "SNS:GetTopicAttributes",
            "SNS:ListSubscriptionsByTopic",
            "SNS:Publish",
            "SNS:Receive",
            "SNS:RemovePermission",
            "SNS:SetTopicAttributes",
            "SNS:Subscribe",
        ]

        resources = [
            aws_sns_topic.sns_codepipeline_notifications.arn
        ]

        condition {
            test = "StringEquals"
            variable = "AWS:SourceOwner"

            values = [
                "${data.aws_caller_identity.current.account_id}"
            ]
        }
    }

    dynamic "statement"{
        for_each = var.allow_backup_notifications == true ? [1] : []

        content {
            sid = "__backup_notifications_id"
            effect = "Allow"

            principals {
                type = "Service"
                identifiers = ["backup.amazonaws.com"]
            }

            actions = [
                "SNS:Publish"
            ]

            resources = [
                aws_sns_topic.sns_codepipeline_notifications.arn
            ]            
        }
    }

    dynamic "statement"{
        for_each = var.allow_codestar_notifications == true ? [1] : []

        content {
            sid = "__codepipeline_notifications_id"
            effect = "Allow"

            principals {
                type = "Service"
                identifiers = ["codestar-notifications.amazonaws.com"]
            }

            actions = [
                "SNS:Publish"
            ]

            resources = [
                aws_sns_topic.sns_codepipeline_notifications.arn
            ]            
        }
    }
}

resource "aws_sns_topic_subscription" "sns_codepipeline_notifications_lambda_subscription" {
    for_each = var.subscriptions

    endpoint = each.value.endpoint
    protocol = each.value.protocol
    topic_arn = aws_sns_topic.sns_codepipeline_notifications.arn
}
