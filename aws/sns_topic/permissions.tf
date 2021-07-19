resource "aws_iam_role" "sns_codepileline_notification_success_role" {

    name = "sns-codepipeline-notification-success-role"
    description = "Role for the topic used to log to CloudWatch when the notification state is success"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "sns.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF

    inline_policy {
        name = "sns-codepipeline-notification-success-policy"
        policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:PutMetricFilter",
                "logs:PutRetentionPolicy"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
    }

    tags = var.tags
}

resource "aws_iam_role" "sns_codepileline_notification_failure_role" {

    name = "sns-codepipeline-notification-failure-role"
    description = "Role for the topic used to log to CloudWatch when the notification state is failure"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "sns.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF

    inline_policy {
        name = "sns-codepipeline-notification-failure-policy"
        policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:PutMetricFilter",
                "logs:PutRetentionPolicy"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
    }

    tags = var.tags
}

