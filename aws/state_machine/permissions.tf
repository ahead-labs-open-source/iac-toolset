resource "aws_iam_role" "state_machine_role" {
    name = "${var.name}-state-machine-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "states.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF

    inline_policy {
        name = "${var.name}-state-machine-policy"
        policy = var.role_inline_policy
    }

    tags = var.tags
}
