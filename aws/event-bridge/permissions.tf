resource "aws_iam_role" "eventbridge_target_role" {
    name = "${var.name}-rule-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "events.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF

    inline_policy {
        name = "${var.name}-rule-policy"
        policy = var.role_inline_policy
    }

    tags = var.tags
}
